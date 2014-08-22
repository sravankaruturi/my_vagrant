<?php
/** The name of the database for WordPress */
define('DB_NAME', 'all_db');
define('USER_DB_NAME', 'user_db');
define('ANALYTICS_DB_NAME', 'analytics_db');
define('FASHION_DB_NAME', 'fashion_db');

/** MySQL database username */
define('DB_USER', 'root');
define('FASHION_DB_USER', 'mspDBman');
define('ANALYTICS_DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');
define('FASHION_DB_PASSWORD', 'ssDBman@1');
define('ANALYTICS_DB_PASSWORD', 'M$P@123');

/** MySQL hostname */
//define('DB_HOST', '10.66.50.2');
define('DB_HOST', '127.0.0.1');
define('FASHION_DB_HOST', '');
define('ANALYTICS_DB_HOST', 'gaia.mysmartprice.info');

/*Define the webserver IP address. Should be used instead of Mysmartprice.com */
define('WEBSERVER','127.0.0.1');
/* Created this SERVER_ADDR as this variable is used in few places in Mobiles */
define('SERVER_ADDR','http://localhost');

/*Define the webserver IP address. Should be used instead of Mysmartprice.com */
define('NGINX_URL','dev.mysmartprice.com');

/*Defines the path in which the property filters will be created. Used for What to Buy */
define('PROP_FILTERS_PATH','/home/vagrant/comparables/public_html/msp/prop_filters/');

/*Document root where the website folder structure starts */
define('DOCUMENT_ROOT','/home/vagrant/comparables/public_html');

/*Defines the directory where all the utility functions aare avaiable*/
define('UTILS_ROOT', DOCUMENT_ROOT.'/msp/utils');

/*SOLR SERVER IP ADDRESS */
//define('SOLR_IP','http://216.185.116.194:8080/');
define('SOLR_IP','http://119.81.61.163:8080/');

define('SOLR_CORE_NAME','electronics');
define('SOLR_MAPPING_CORE_NAME','map');

/*SOLR QUERY PATH where the solr queries are presented  for MAPPING*/
define('SOLR_MAP_QUERY_PATH', 'http://216.185.116.194:8080/'. 'solr/map/select?fl=*%2Cscore&wt=json&q=');

/*SOLR QUERY PATH where the solr queries are presented  for SEARCHING*/
define('SOLR_SEARCH_QUERY_PATH_EXCLUDE_NOPRICE', SOLR_IP . 'solr/electronics/select?fl=*%2Cscore&fq=price%3A%5B1+TO+*%5D&wt=json&q=');

/*SOLR QUERY PATH where the solr queries are presented  for SEARCHING*/
define('SOLR_SEARCH_QUERY_PATH', SOLR_IP . 'solr/electronics/select?fl=*%2Cscore&wt=json&q=');


/*SOLR FULL IMPORT url for Core SEARCH*/
define('SOLR_SEARCH_FULL_IMPORT', SOLR_IP . 'solr/electronics/dataimport?command=full-import');

/*SOLR FULL IMPORT url for Core MAP*/
define('SOLR_MAP_FULL_IMPORT', '216.185.116.194:8080'. 'solr/map/dataimport?command=full-import');

/*SOLR DELTA IMPORT url for Core MAP*/
define('SOLR_MAP_DELTA_IMPORT', SOLR_IP . 'solr/map/dataimport?command=delta-import');

/*CDN URL for Stores Images */
define('CDN_URL','http://c0028655.cdn1.cloudfiles.rackspacecloud.com');
define('BOOKS_CDN_URL','http://c398754.r54.cf1.rackcdn.com');
define('MOBILE_IMAGE_CDN','http://c0028545.cdn1.cloudfiles.rackspacecloud.com/');

/* Mobile Database Credentials */
define('MOBILE_DB_NAME', 'binaryd1_booksbkp');
define('MOBILE_DB_USER', 'binaryd1_user');
define('MOBILE_DB_PASSWORD', 'password');
define('MOBILE_DB_HOST', '127.0.0.1');
/* Mobile db end */

/** Book MySQL database  */
define('BOOK_DB', 'books_db');

/** Book MySQL database username */
define('BOOK_DB_USER', 'book_user');

/** BOOK MySQL database password */
define('BOOK_DB_PASSWORD', 'b00ks@m$p');

/** BOOK MySQL hostname */
define('BOOK_DB_HOST', '50.56.224.68');

define('SINGLE_CACHE_TIME',1);

/* Email Related Settings */
define ('SENDGRID_USER','sulakshan@mysmartprice.com');
define ('SENDGRID_PASSWORD','hyd@12345');

define ('CRAWL_PROXY','119.81.55.179');

define('CACHE_ROOT','/tmp/msp/');

/* crawl db credentials */
define('CRAWL_DB_NAME','crawl_db');
define('CRAWL_DB_USER','prod_user');
define('CRAWL_DB_PASSWORD','MsP4o1');
define('CRAWL_DB_HOST','crawl.mspsg.in');
/* crawl db end */
