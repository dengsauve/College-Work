<?php

$title = "Edit Restaurant";
include 'includes/header.php';
include 'includes/functions.php';

$id = $_GET['id'];

$db = db_connect();

$sql = "select * from restaurants where id=$id";

$result = $db->query($sql);

mysqli_close( $db );

list($id, $name, $location, $priceRangeLow, $priceRangeHigh, $tags, $modifiedAt, $createdAt) = $result->fetch_row();

$form = <<<END_OF_EDITING

  <h1>Editing $name</h1>
  
  <form method="POST" action="/restaurant_edit.php" class="text-left col-md-6 col-md-offset-3">
    
    <div class="form-group">
      <label for="name">Name:</label>
      <input class="form-control" type="text" name="name" id="name" value="$name" />    
    </div>
    
    <div class="form-group">
      <label for="location">Location:</label>
      <input type="text" class="form-control" name="location" id="location" value="$location" />
    </div>
    
    <div class="form-group">
      <label for="priceLow">Price Range Low:</label>
      <input type="number" class="form-control" name="priceLow" id="priceLow" value="$priceRangeLow" />
    </div>
    
    <div class="form-group">
      <label for="priceHigh">Price Range High:</label>
      <input class="form-control" type="number" name="priceHigh" id="priceHigh" value="$priceRangeHigh" />    
    </div>
    
    <div class="form-group">
      <label for="tags">Tags:</label>
      <input class="form-control" type="text" name="tags" id="tags" value="$tags" />    
    </div>    
    
  </form>    


END_OF_EDITING;

echo $form;



include 'includes/footer.php';

?>
