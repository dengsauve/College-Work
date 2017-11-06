<?php

ob_start();

$title = "Create Restaurant";
include 'includes/header.php';
include 'includes/functions.php';


$submit = $_POST["submit"];
$db = db_connect();

// Variables are populated
$name = '';
$location = '';
$priceRangeLow = 0.00;
$priceRangeHigh = 0.00;
$tags = '';

if( !empty( $submit ) ) {

  $name = $_POST["name"];
  $location = $_POST["location"];
  $priceRangeLow = $_POST["priceRangeLow"];
  $priceRangeHigh = $_POST["priceRangeHigh"];
  $tags = $_POST["tags"];

  // Check code for errors
  $found_error = false;

  if (empty($name)) {
    $name_error = "Name is Required";
    $found_error = true;
  }
  if (empty($location)) {
    $location_error = "Location is Required";
    $found_error = true;
  }

  // Check that priceLow is less than priceHigh
  if( $priceRangeLow > $priceRangeHigh){
    $priceRangeError = "Price Range Low must be less than Price Range High";
    $found_error = true;
  }

  if( !$found_error ){
    $sql = "INSERT INTO `restaurants` (`id`, `name`, `location`, `priceRangeLow`, `priceRangeHigh`, `tags`, `modifiedAt`, `createdAt`) VALUES (NULL, '$name', '$location', '$priceRangeLow', '$priceRangeHigh', '$tags', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";

    echo $sql;
    $result = $db->query($sql);

    ob_clean();
    header("Location: /restaurant.php?id=$db->insert_id");
    exit;

  }
}

$form = <<<END_OF_EDITING

  <h1>Create a new Restaurant</h1>
  
  <form method="POST" action="/restaurant_new.php" class="text-left col-md-6 col-md-offset-3">
    
    <div class="form-group">
      <label for="name">Name:</label>
      <input class="form-control" type="text" name="name" id="name" value="$name" />    
      <p class="help-block">$name_error</p>
    </div>
    
    <div class="form-group">
      <label for="location">Location:</label>
      <input type="text" class="form-control" name="location" id="location" value="$location" />
      <p class="help-block">$location_error</p>
    </div>
    
    <div class="form-group">
      <label for="priceRangeLow">Price Range Low:</label>
      <input class="form-control" type="number" step=".01" name="priceRangeLow" id="priceRangeLow" value="$priceRangeLow" />
      <p class="help-block">$priceRangeError</p>
    </div>
    
    <div class="form-group">
      <label for="priceRangeHigh">Price Range High:</label>
      <input class="form-control" type="number" step=".01" name="priceRangeHigh" id="priceRangeHigh" value="$priceRangeHigh" />    
    </div>
    
    <div class="form-group">
      <label for="tags">Tags:</label>
      <input class="form-control" type="text" name="tags" id="tags" value="$tags" />    
    </div>
    
    <div class="form-group">
      <input type="submit" name="submit" value="Create Restaurant" class="btn btn-primary" />
      <a href="restaurants.php" class="btn btn-default">Cancel</a>
    </div>
        
  </form>    


END_OF_EDITING;

echo $form;

include 'includes/footer.php';

ob_end_flush();

?>
