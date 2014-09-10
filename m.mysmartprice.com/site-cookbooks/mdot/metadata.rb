name             'mdot'
maintainer       'MySmartPrice'
maintainer_email 'prasanth@mysmartprice.com'
license          'All rights reserved'
description      'Installs/Configures m.mysmartprice.com'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt'
depends 'nginx'
depends 'mysql'
depends 'php-fpm'
depends 'database'
