<?php

ob_start();

$title = "Edit Restaurant";
include 'includes/header.php';
include 'includes/functions.php';

$id = $_GET['id'];
$submit = $_POST["submit"];
$db = db_connect();

if ( empty($submit) ) {
  // Get data from the database
  $sql = "select * from restaurants where id=$id";

  $result = $db->query($sql);

  list($id, $name, $location, $priceRangeLow, $priceRangeHigh, $tags, $modifiedAt, $createdAt) = $result->fetch_row();

} else {
  // Get data from posted form
  $name = $_POST["name"];
  $location = $_POST["location"];
  $priceRangeLow = $_POST["priceRangeLow"];
  $priceRangeHigh = $_POST["priceRangeHigh"];
  $tags = $_POST["tags"];

  // Check code for errors
  // Update the database with POST data

  $modifiedAt = date_create()->format("Y-m-d H:i:s");

  $sql = "UPDATE restaurants SET name='$name',
                                  location='$location',
                                  priceRangeLow='$priceRangeLow',
                                  priceRangeHigh='$priceRangeHigh',
                                  tags='$tags',
                                  modifiedAt='$modifiedAt'
WHERE id='$id'";

  echo $sql;

  $result = $db->query($sql);

  echo 'Updated Database!';

  ob_clean();
  header("Location: /restaurant.php?id=$id");
  exit;
}

// Variables are populated

mysqli_close($db);

$form = <<<END_OF_EDITING

  <h1>Editing $name</h1>
  
  <form method="POST" action="/restaurant_edit.php?id=$id" class="text-left col-md-6 col-md-offset-3">
    
    <div class="form-group">
      <label for="name">Name:</label>
      <input class="form-control" type="text" name="name" id="name" value="$name" />    
    </div>
    
    <div class="form-group">
      <label for="location">Location:</label>
      <input type="text" class="form-control" name="location" id="location" value="$location" />
    </div>
    
    <div class="form-group">
      <label for="priceRangeLow">Price Range Low:</label>
      <input type="number" class="form-control" name="priceRangeLow" id="priceRangeLow" value="$priceRangeLow" />
    </div>
    
    <div class="form-group">
      <label for="priceRangeHigh">Price Range High:</label>
      <input class="form-control" type="number" name="priceRangeHigh" id="priceRangeHigh" value="$priceRangeHigh" />    
    </div>
    
    <div class="form-group">
      <label for="tags">Tags:</label>
      <input class="form-control" type="text" name="tags" id="tags" value="$tags" />    
    </div>
    
    <div class="form-group">
      <input type="submit" name="submit" value="Save Changes" class="btn btn-primary" />
      <a href="restaurant.php?id=$id" class="btn btn-default">Cancel</a>
    </div>
    
    <a href="restaurants.php" class="btn btn-link btn-sm" role="button">Back to All Restaurants</a>
    
  </form>    


END_OF_EDITING;

echo $form;

include 'includes/footer.php';

ob_end_flush();

?>
