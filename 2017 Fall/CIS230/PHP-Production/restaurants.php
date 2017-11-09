<?php


$title = 'Restaurants';
include 'includes/header.php';
include 'includes/functions.php';

$db = db_connect();

// number of records to display per page
$perPage = 10;
if( !empty($_GET['perPage'] && is_numeric($_GET['perPage']))){
  $perPage = $_GET['perPage'];
}

// which page of records you want to see
$page = 1;
if ( !empty($_GET['page'] && is_numeric($_GET['page']))){
  $page = $_GET['page'];
}

// showing where to start in the sql string
$startRecord = ($page - 1) * $perPage;

// Getting the total number of records from table
$totalRestaurants = $db->query('select count(id) from restaurants')->fetch_row()[0];
$totalPages = $totalRestaurants / $perPage;
$lastPage = round(( 1.0 * $totalRestaurants / $perPage), 0, PHP_ROUND_HALF_UP);

// sql command based on OPTIONAL url parameters
$sql = "select * from restaurants limit $perPage offset $startRecord";

$result = $db->query($sql);

mysqli_close( $db );


// Get incoming delete message
$deleteMessage = $_GET['dmsg'];


// Pagination Buttons
if($page <= 1){
  // Gives the pagination buttons as disabled
  $previousButton = "<a href='/restaurants.php?page=$previousPage' class='btn btn-info btn-small disabled'>Previous Page</a>";
  $firstButton = "<a href='/restaurants.php?page=1' class='btn btn-info btn-small disabled'>First Page</a>";
}else{
  // Gives the pagination buttons
  $previousPage = $page - 1;
  $previousButton = "<a href='/restaurants.php?page=$previousPage' class='btn btn-info btn-small'>Previous Page</a>";
  $firstButton = "<a href='/restaurants.php?page=1' class='btn btn-info btn-small'>First Page</a>";
}

if( $page >= $totalPages){
  // Gives the pagination buttons as disabled
  $nextButton = "<a href='/restaurants.php?page=$nextPage' class='btn btn-info btn-small disabled'>Next Page</a>";
  $lastButton = "<a href='/restaurants.php?page=$lastPage' class='btn btn-info btn-small disabled'>Last Page</a>";
}else{
  // Gives the pagination buttons
  $nextPage = $page + 1;
  $nextButton = "<a href='/restaurants.php?page=$nextPage' class='btn btn-info btn-small'>Next Page</a>";
  $lastButton = "<a href='/restaurants.php?page=$lastPage' class='btn btn-info btn-small'>Last Page</a>";
}


// Here Doc
$table = <<<END_OF_TABLE
<h1>Restaurants</h1>

<hr/>

<p class="help-block">$deleteMessage</p>

<div>
  <div class="text-center col-xs-6">
    $firstButton
    $previousButton
  </div>
  <div class="text-center col-xs-6">
    $nextButton
    $lastButton
  </div>
</div>

<br />

<table class="table text-left table-hover">
  <thead>
    <tr>
    <th>ID</th>
      <th>Name</th>
      <th>Location</th>
      <th>Price Range Low</th>
      <th>Price Range High</th>
      <th>Tags</th>
      <th>Controls</th>
    </tr>
  </thead>
  <tbody>  
END_OF_TABLE;

echo $table;

  while (list($id, $name, $location, $priceRangeLow, $priceRangeHigh, $tags, $modifiedAt, $createdAt) = $result->fetch_row()) {
    echo "<tr>\n",
        "\t<th scope='row'>" . $id . "</th>\n",
        "\t<td><a href='restaurant.php?id=$id' title='Details'>" . $name . "</a></td>\n",
        "\t<td>" . substr($location, 0, 20) . "..." . "</td>\n",
        "\t<td>" . $priceRangeLow . "</td>\n",
        "\t<td>" . $priceRangeHigh . "</td>\n",
        "\t<td>" . $tags . "</td>\n",
        "\t<td class='text-nowrap'>
              <a href='restaurant_edit.php?id=" . $id . "' class='btn btn-info btn-sm'>Edit</a>
              <a href='restaurant_delete.php?id=" . $id . "' class='btn btn-danger btn-sm'>Delete</a>
           </td>\n",
        "<tr>\n";
  }

  //echo "no more records";

  ?>
  </tbody>
</table>

<div class="text-left">
  <a href="restaurant_new.php" class="btn btn-primary">Create Restaurant</a>
</div>

<?php

include 'includes/footer.php';

?>
