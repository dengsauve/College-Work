<?php
/**
 * Created by PhpStorm.
 * User: dengs
 * Date: 12/7/2017
 * Time: 3:22 AM
 */

ob_start();

include 'includes/header.php';
include 'includes/functions.php';

$db = db_connect();

if( !empty($_POST['submit']) )
{

// Validation Time!

  $noErrors = true;

  $id = mysqli_real_escape_string($db, $_POST['id']);
  if( empty($id) || !is_numeric($id) ){
    ob_clean();
    header("Location: /products.php");
  }

  $name = mysqli_real_escape_string($db, $_POST['name']);
  if( empty($name) ){
    $noErrors = false;
    $nameError = "<p class='help-block'>You Must Enter a Name</p>";
  }

  $description = mysqli_real_escape_string($db, $_POST['description']);
  if( empty($description) ){
    $noErrors = false;
    $descriptionError = "<p class='help-block'>You Must Enter a Description</p>";
  }

  $price = mysqli_real_escape_string($db, $_POST['price']);
  if( empty(price) ){
    $noErrors = false;
    $priceError = "<p class='help-block'>You Must Enter a Price</p>";
  }
  elseif( !is_numeric($price) ){
    $noErrors = false;
    $priceError = "<p class='help-block'>Price must be a whole number or decimal</p>";
  }

  $cost = mysqli_real_escape_string($db, $_POST['cost']);
  if( empty($cost) ){
    $noErrors = false;
    $costError = "<p class='help-block'>You Must Enter a Cost</p>";
  }
  elseif( !is_numeric($cost) ){
    $noErrors = false;
    $costError = "<p class='help-block'>Cost must be a whole number or decimal</p>";
  }

  $quantity = mysqli_real_escape_string($db, $_POST['quantity']);
  if( empty($quantity) ){
    $noErrors = false;
    $quantityError = "<p class='help-block'>You Must Enter a Quantity</p>";
  }
  elseif( !is_numeric($quantity) ){
    $noErrors = false;
    $quantityError = "<p class='help-block'>Quantity must be a whole number or decimal</p>";
  }

  $image = mysqli_real_escape_string($db, $_POST['image']);
  if( !filter_var($image, FILTER_VALIDATE_URL) ){
    $noErrors = false;
    $imageError = "<p class='help-block'>Please enter a valid URL</p>";
  }

  $thumbnail = mysqli_real_escape_string($db, $_POST['thumbnail']);
  if( !filter_var($thumbnail, FILTER_VALIDATE_URL) ){
    $noErrors = false;
    $thumbnailError = "<p class='help-block'>Please enter a valid URL</p>";
  }

  $sql = "update products set name='$name', description='$description', price='$price', cost='$cost', quantity='$quantity', image='$image', thumbnail='$thumbnail' where product_id='$id'";
  $result = $db->query($sql);

  ob_clean();
  header("Location: /product.php?id=$id");
}
else
{
  $id = mysqli_real_escape_string($db, $_GET['id']);

  $sql = "select * from products where product_id=$id";
  $result = $db->query($sql);

  list($id, $name, $description, $price, $cost, $quantity, $image, $thumbnail) = $result->fetch_row();
}

$product_form = <<<END_OF_PRODUCT_FORM

<section class="col-md-6 col-md-offset-3 text-left">
  <form action="product_edit.php" method="post">
    
    <input type="hidden" name="id" value="$id" />
    
    <div class="form-group">
      <label for="name">Product Name:</label>
      <input type="text" name="name" value="$name" class="form-control" required />
      $nameError
    </div>
    
    <div class="form-group">
      <label for="description">Product Description:</label>
      <textarea name="description" class="form-control">$description</textarea>
      $descriptionError
    </div>
    
    <div class="form-group">
      <label for="price">Price:</label>
      <input name="price" value="$price" class="form-control" required />
      $priceError
    </div>
  
    <div class="form-group">
      <label for="cost">Cost:</label>
      <input name="cost" value="$cost" class="form-control" required />
      $costError
    </div>
    
    <div class="form-group">
      <label for="quantity">Quantity on Hand:</label>
      <input type="number" name="quantity" value="$quantity" class="form-control" required />
      $quantityError
    </div>
    
    <div class="form-group">
      <label for="image">Full Image</label>
      <input type="text" name="image" value="$image" class="form-control" required />
      $imageError
    </div>
    
    <div class="form-group">
      <label for="thumbnail">Thumbnail Image:</label>
      <input type="text" name="thumbnail" value="$thumbnail" class="form-control" required />
      $thumbnailError
    </div>
    
    <button type="submit" name="submit" value="submit" class="btn btn-success">Update Product</button> 
    <a href="products.php" class="btn btn-default">Back to All Products</a>
  
  </form>
</section>

END_OF_PRODUCT_FORM;

echo $product_form;