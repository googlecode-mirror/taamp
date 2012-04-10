<?php

$memcache = new Memcache;
$memcache->connect('localhost', 11211) or die ("Could not connect");

$version = $memcache->getVersion();
echo "Server's version: ".$version."<br/>\n";

$tmp_object = new stdClass;
$tmp_object->str_attr = 'test';
$tmp_object->int_attr = 123;
$tmp_object->timestamp = time();


$memcache->set('afdf/sdafsdfl/asdfsfd', $tmp_object, false, 10) or die ("Failed to save data at the server");
echo "Store data in the cache (data will expire in 10 seconds)<br/>\n";

$get_result = $memcache->get('afdf/sdafsdfl/asdfsfd.php');
echo "Data from the cache:<br/>\n";

var_dump($get_result);

?>
