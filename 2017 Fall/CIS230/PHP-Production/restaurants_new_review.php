<?php

include "includes/functions.php";

// Get the POST data
$restaurantIDFK = $_POST["restaurantIDFK"];
$author = $_POST["author"];
$reviewText = $_POST["reviewText"];
$rating = $_POST["rating"];

// peg the rating
if( empty($rating) || $rating < 0 ){
  $rating = 1;
}
if( $rating > 5 ){
  $rating = 5;
}

// catch no author
if( empty($author) ){
  $author = "anonymous";
}

// echo $restaurantIDFK . ' ' . $author . ' ' . $reviewText . ' ' . $rating; // debugging

$sql = "insert into reviews (id, author, review, rating, created_at, restaurantIDFK)
                    values (null, '$author', '$reviewText', $rating, CURRENT_TIMESTAMP, $restaurantIDFK)";

// echo "<br/>" . $sql; // debugging

$db = db_connect();
$result = $db->query($sql);
$db->close();

header("Location: /restaurant.php?id=$restaurantIDFK");