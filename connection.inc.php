<?php
session_start();
$con=mysqli_connect("localhost","root","","ecom");
define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/projects/gss/petglory/');
define('SITE_PATH','http://localhost/projects/gss/petglory/');

define('PRODUCT_IMAGE_SERVER_PATH',SERVER_PATH.'media/product/');
define('PRODUCT_IMAGE_SITE_PATH',SITE_PATH.'media/product/');
?>