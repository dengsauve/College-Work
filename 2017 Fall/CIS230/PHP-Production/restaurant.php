<?php

$title = "Restaurant";
include 'includes/header.php';
include 'includes/functions.php';

$id = $_GET['id'];

$db = db_connect();

$sql = "select * from restaurants where id=$id";

$result = $db->query($sql);

mysqli_close( $db );

list($id, $name, $location, $priceRangeLow, $priceRangeHigh, $tags, $modifiedAt, $createdAt) = $result->fetch_row();


$detail = <<<END_OF_DETAIL

<a href="restaurants.php">See All Restaurants</a>

<h1>Restaurant</h1>

<p>This is a page that shows one restaurants details.</p>

<h2>$name</h2>
<p>$location</p>
<p>$priceRangeLow</p>
<p>$priceRangeHigh</p>
<p>$tags</p>
<p>$modifiedAt</p>
<p>$createdAt</p>

<a href="restaurant_edit.php?id=$id">Edit This Restaurant!</a>

END_OF_DETAIL;

echo $detail;

include 'includes/footer.php';

?>
