<?php

$title = "Restaurant";
include 'includes/header.php';
include 'includes/functions.php';

$id = $_GET['id'];
$restaurantID = $id;

$db = db_connect();

$sql = "select * from restaurants where id=$id";

$result = $db->query($sql);

list($id, $name, $location, $priceRangeLow, $priceRangeHigh, $tags, $modifiedAt, $createdAt) = $result->fetch_row();

echo '<div class="col-md-6 col-md-push-3">';

$detail = <<<END_OF_DETAIL

  <h1 class="text-left">Restaurant</h1>
  
  <hr />
  
  <dl class="text-left">
  
      <dt>Name</dt>
      <dd>$name</dd>
      
      <dt>Location</dt>
      <dd>$location</dd>
      
      <dt>Price Range Low</dt>
      <dd>$priceRangeLow</dd>
      
      <dt>Price Range Hi</dt>
      <dd>$priceRangeHigh</dd>
      
      <dt>Tags</dt>
      <dd>$tags</dd>
      
      <dt>Modified At</dt>
      <dd>$modifiedAt</dd>
      
      <dt>Created At</dt>
      <dd>$createdAt</dd>
    
  </dl>
  <div class="text-left">
    <a href="restaurant_edit.php?id=$id" class="btn btn-info btn-sm">Edit This Restaurant!</a>
    <a href="restaurants.php" class="btn btn-default btn-sm">See All Restaurants</a>
  </div>


END_OF_DETAIL;
echo $detail;

$sql = "select * from reviews where restaurantIDFK=$id";
$result = $db->query($sql);

$sql = "select avg(rating) from reviews where restaurantIDFK=$id";
$numberStars = $db->query($sql)->fetch_row()[0];

$starString = str_repeat("<img src='images/star.png' class='review-star' alt='star'>", $numberStars);

echo "<h2 class='text-left'>Reviews $starString</h2><hr/>";

while (list($id, $author, $review, $rating, $createdAt, $restaurantIDFK) = $result->fetch_row()) {

  $starString = str_repeat("<img src='images/star.png' class='review-star-sm' alt='star'>", $rating);

  $review_section = <<<END_OF_REVIEWS
  
  <div class="well well-sm">
  
    <dl class="text-left restaurant-review">
    
      <dt>Name</dt>
      <dd>$author</dd>
      <dt>Rating</dt>
      <dd>$starString</dd>
      <dt>Review</dt>
      <dd>$review</dd>
      <dt>Reviewed On</dt>
      <dd>$createdAt</dd>
      
    </dl>
      
  </div>
  

END_OF_REVIEWS;
  echo $review_section;
}


// Need Author, Reviewtext, rating, restaurantIDFK
$review_form = <<<END_OF_FORM

<form method="post" action="restaurants_new_review.php" class="text-left">

  <div class="form-group">
    <label for="author">Author:</label>
    <input type="text" name="author" class="form-control" required>
  </div>
  
  <div class="form-group">
    <label for="reviewText">Review:</label>
    <textarea name="reviewText" class="form-control"></textarea>
  </div>
  
  <div class="form-group">
    <label for="rating">Rating (out of 5):</label>
    <input type="number" name="rating" class="form-control" min="0" max="5" step="1">
  </div>  
  
  <div class="form-group">
    <input type="hidden" name="restaurantIDFK" value="$restaurantID">
  </div>
  <div class="form-group">
    <input type="submit" name="submit" value="Post Review" class="btn btn-primary">
  </div>
  
</form>

END_OF_FORM;

echo $review_form;

echo "</div>";

mysqli_close($db);

include 'includes/footer.php';

?>
