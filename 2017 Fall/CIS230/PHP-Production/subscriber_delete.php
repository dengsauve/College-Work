<?php
/**
 * Created by PhpStorm.
 * User: dennis
 * Date: 12/7/17
 * Time: 10:48 PM
 */

ob_start();

include 'includes/header.php';

if( empty($_SESSION['user']) ){
  ob_clean();
  header('Location: /');
  exit;
}

include 'includes/functions.php';

$db = db_connect();
$id = mysqli_real_escape_string($db, $_GET['id']);
$sql = "delete from subscribers where subscriber_id='$id'";
$db->query($sql);

ob_clean();
header('Location: /subscribers.php');