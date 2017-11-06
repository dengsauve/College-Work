<?php

include 'includes/functions.php';

$id = $_GET['id'];

$db = db_connect();

$sql = "delete from restaurants where id=$id";

$result = $db->query($sql);

mysqli_close( $db );

// Message that it's been deleted!
// Only if deletion happened

if ($result){
  header("Location: /restaurants.php?dmsg=Restaurant $id successfully deleted!");
}else{
  header("Location: /restaurants.php?dmsg=Error deleting restaurant ID: $id.");
}

