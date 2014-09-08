#! /bin/bash


####################################################################################################
# Constants
####################################################################################################

ENVIRONMENT="dev";

INCLUDE_PATH="/home/vagrant/comparables/includes/"
DOCUMENT_ROOT="/home/vagrant/comparables/public_html/"
WEB_ROOT="http://$ENVIRONMENT.mysmartprice.com"
MSP_PROCESSES="$WEB_ROOT/msp/processes/"
CACHE_ROOT="/tmp/msp/"




####################################################################################################
# Settings
####################################################################################################

settings_source="${INCLUDE_PATH}settings.${ENVIRONMENT}.php"
settings_final="/usr/share/php/settings.php"
redis_source="${INCLUDE_PATH}redis-config-local.${ENVIRONMENT}.php"
redis_final="/usr/share/php/redis-config-local.php"

# Check for existing settings file
if [ -L $settings_final ]
then
    # Back it up
    cp $settings_final "$settings_final.bak"
    unlink $settings_final
fi
ln -s $settings_source $settings_final

# And redis-config-local
if [ -L $redis_final ]
then
    # Back it up
    cp $redis_final "$redis_final.bak"
    unlink $redis_final
fi
ln -s $redis_source $redis_final




####################################################################################################
# File System
####################################################################################################

declare -a categories=("mobile" "accessories" "camera" "care" "appliance" "electronics")

# Cache Root
if [ -d $CACHE_ROOT ]
then
    rm -rf $CACHE_ROOT
fi
mkdir $CACHE_ROOT

# File Permissions
for category in "${categories[@]}"
do
    # Price Lists
    # Cache Folders
    mkdir -p "${DOCUMENT_ROOT}${category}/pricelist" "${DOCUMENT_ROOT}${category}/cache"
    chmod -R 777 "${DOCUMENT_ROOT}${category}/pricelist" "${DOCUMENT_ROOT}${category}/cache"

    # Category Home Page
    touch "${DOCUMENT_ROOT}${category}/pricelist"
    chmod -R 777 "${DOCUMENT_ROOT}${category}/index.html"
done

# Property Filters
mkdir "${DOCUMENT_ROOT}msp/prop_filters"
chmod -R 777 "${DOCUMENT_ROOT}msp/prop_filters"



####################################################################################################
# Database Import
####################################################################################################
sed -i 's/216.185.116.195/192.168.33.10/g' /home/vagrant/db_dumps/*.sql
mysql -u root -proot < /home/vagrant/db_dumps/user_grants.sql
mysql -u root -proot < /home/vagrant/db_dumps/all_db.sql
mysql -u root -proot < /home/vagrant/db_dumps/user_db.sql
mysql -u root -proot < /home/vagrant/db_dumps/binaryd1_booksbkp.sql


####################################################################################################
# WGETs
####################################################################################################

declare -a urls=("${MSP_PROCESSES}lists/createnewbrandlists.php" "${MSP_PROCESSES}lists/createnewtypelists.php" "${MSP_PROCESSES}property/ui-factory/generate_left_sidebar.php" "${MSP_PROCESSES}property/loader/msp_load_data_redis.php" "${WEB_ROOT}/m/utils/msp_load_redis_url.php" "${WEB_ROOT}/api/product/master_saves_details.php" "${WEB_ROOT}/cron_scripts/master_to_redis.php")
for url in "${urls[@]}"
do
    wget -bq $url -O /dev/null
done

