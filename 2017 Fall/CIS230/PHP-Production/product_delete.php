<?php
/**
 * Created by PhpStorm.
 * User: dengs
 * Date: 12/7/2017
 * Time: 4:17 AM
 */

ob_start();

include 'includes/functions.php';

$db = db_connect();
$id = mysqli_real_escape_string($db, $_GET['id']);

if( !empty($id) ){
  $sql = "delete from products where product_id=$id";
  $db->query($sql);

  ob_clean();
  header("Location: /products.php");
}