<?php

$title = 'Restaurants';
include 'includes/header.php';
include 'includes/functions.php';

$db = db_connect();

$sql = "select * from restaurants";

$result = $db->query($sql);

mysqli_close( $db );

// Get incoming delete message
$deleteMessage = $_GET['dmsg'];


// Here Doc
$table = <<<END_OF_TABLE
<h1>Restaurants</h1>

<hr/>

<p class="help-block">$deleteMessage</p>

<div class="text-left">
  <a href="restaurant_new.php" class="btn btn-primary">Create Restaurant</a>
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
