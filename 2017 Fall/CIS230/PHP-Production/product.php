<?php
/**
 * Created by PhpStorm.
 * User: dengs
 * Date: 12/7/2017
 * Time: 2:59 AM
 */

include 'includes/header.php';
include 'includes/functions.php';

$db = db_connect();

$author = mysqli_real_escape_string($db, $_POST['author']);
$review = mysqli_real_escape_string($db, $_POST['review']);
$rating = mysqli_real_escape_string($db, $_POST['rating']);
$id = mysqli_real_escape_string($db, $_POST['id']);

if( !empty($_POST['submit']) )
{
  $noErrors = true;

  if( empty($author) ){
    $noErrors = false;
    $authorError = "<p class='help-block'>You must enter your name</p>";
  }

  if( empty($rating) || !is_numeric($rating) ){
    $noErrors = false;
    $ratingError = "<p class='help-block'>You must choose a numeric rating.</p>";
  }

  if( $noErrors ){
    $sql = "insert into product_reviews values (null, '$id', '$review', '$rating', '$author', CURRENT_TIMESTAMP)";
    $result = $db->query($sql);
    $author = '';
    $review = '';
    $rating = '';
  }
}


$id = mysqli_real_escape_string($db, $_GET['id']);

$sql = "select * from products where product_id='$id'";
$result = $db->query($sql);

list($id, $name, $description, $price, $cost, $quantity, $image, $_thumb) = $result->fetch_row();

$sql = "select avg(rating) from product_reviews where productIDFK='$id'";
$numberStars = $db->query($sql)->fetch_row()[0];

$starString = str_repeat("<img src='images/star.png' class='review-star-sm' alt='star'>", $numberStars);

$product_top = <<<END_OF_PRODUCT_TOP

<section class="col-md-6 col-md-offset-3">
  <div class="panel panel-default">
    <div class="panel-heading">$name - $starString</div>
    <div class="panel-body">
      <img src="$image" class="product-image"/>
      <p class="col-xs-12">$description</p>
    </div>
    
    <ul class="list-group">
      <li class="list-group-item text-left">$$price</li>
      <li class="list-group-item text-left">$$cost</li>
      <li class="list-group-item text-left">$quantity</li>
    </ul>
  </div>
</section>

<section class="col-md-6 col-md-offset-3">
  <a href="products.php" class="btn btn-default pull-left">Back to All Products</a>
</section>
END_OF_PRODUCT_TOP;

echo $product_top;

$review_form = <<<END_OF_REVIEW_FORM

<h3 class="col-xs-12">Reviews</h3>
<hr class="col-xs-12 col-md-6 col-md-offset-3"/>

<div class="col-md-6 col-md-offset-3">
  <section class="text-left well well-lg">
    <form action="product.php?id=$id" method="post">
      
      <input type="hidden" name="id" value="$id">
      
      <div class="form-group">
        <label for="author">Author:</label>
        <input name="author" value="$author" class="form-control" required/>
        $authorError
      </div>
      
      <div class="form-group">
        <label for="review">Review:</label>
        <textarea class="form-control" name="review">$review</textarea>
      </div>
      
      <div class="form-group">
        <label for="rating">Rating:</label>
        <select class="form-control" name="rating" required >
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
        $selectError
      </div>
      
      <button type="submit" name="submit" value="submit" class="btn btn-primary">Add Review</button>
    
    </form>
  
  </section>
</div>
END_OF_REVIEW_FORM;

echo $review_form;

// Grab all reviews for product

$sql = "select * from product_reviews where productIDFK='$id'";
$result = $db->query($sql);

while( list($_rid, $_pid, $review_text, $review_rating, $review_author, $created) = $result->fetch_row() )
{
  $starString = str_repeat("<img src='images/star.png' class='review-star-sm' alt='star'>", $review_rating);
  $review_block = <<<END_OF_REVIEW_BLOCK

<div class="col-md-6 col-md-offset-3 text-left">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">$review_author - $starString</h3>
    </div>
    <div class="panel-body">
      $review_text
    </div>
  </div>
</div>

END_OF_REVIEW_BLOCK;

  echo $review_block;
}

include 'includes/footer.php';