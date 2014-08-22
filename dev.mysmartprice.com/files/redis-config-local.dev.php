<?php

//Database definitions
define('PROPERTY_DB',8);
define('HTML_FRAGMENT_DB',1);
define('STORE_DB',2);
define('PRICE_DB',3);
define('TITLE_DB',4);
define('MOBSITE_DB',5);
define('DEAL_DB',6); // can be used for weightage related stuff. DB 10 is used for snipperts
define('SUBCAT_URL_DB',7);

//Fashion Databases in Redis
define('FASHION_SNIPPETS_DB',11);

//API related Databases.
define('API_JSON_DB',12);
//Cache DB
define('CACHE_DB',13);

define('CACHE_REQUEST',9);
define('SENDTOSTORE',15);

function get_redis_connection($db_name, $prefix="") {
  require_once 'Predis/Autoloader.php';
  Predis\Autoloader::register();
  $redis = new Predis\Client(array(
                                   'scheme'   => 'tcp',
                                   'host' => 'localhost',
                                   'port' => 6379,
                                   'database' => $db_name
                                  ), array('prefix' => $prefix));
  return $redis;
}


?>
