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

$id = mysqli_real_escape_string($db, $_GET['id']);

$sql = "select * from products where product_id='$id'";
$result = $db->query($sql);

list($id, $name, $description, $price, $cost, $quantity, $image, $_thumb) = $result->fetch_row();

$product_top = <<<END_OF_PRODUCT_TOP

<section class="col-md-6 col-md-offset-3">
  <div class="panel panel-default">
    <div class="panel-heading">$name</div>
    <div class="panel-body">
      <img src="$image" class="product-image"/>
      <p class="col-xs-12">$description</p>
    </div>
    
    <ul class="list-group">
      <li class="list-group-item">$$price</li>
      <li class="list-group-item">$$cost</li>
      <li class="list-group-item">$quantity</li>
    </ul>
  </div>
</section>

<section class="col-md-6 col-md-offset-3">
  <a href="products.php" class="btn btn-default pull-left">Back to All Products</a>
</section>
END_OF_PRODUCT_TOP;

echo $product_top;

$review_form = <<<END_OF_REVIEW_FORM

<section class="col-md-6 col-md-offset-3 text-left">
  <form action="product.php?id=$id" method="post">
    <!-- author, review, rating -->
    <div class="form-group">
      <label for="author">Author:</label>
      <input name="author" value="$author" class="form-control" />
    </div>
    
    <div class="form-group">
      <label for="review">Review:</label>
      <textarea class="form-control" name="review">$review</textarea>
    </div>
    
    <!-- left off here! -->
    
    <div class="form-group">
    
    </div>
  
  </form>

</section>

END_OF_REVIEW_FORM;



include 'includes/footer.php';