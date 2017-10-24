<?php

$title = 'Restaurants';
include 'includes/header.php';
include 'includes/functions.php';

$db = db_connect();

$sql = "select * from restaurants";

$result = $db->query($sql);

/*
$sql = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'phpdevdennissauvecom' AND TABLE_NAME = 'restaurants';";
$table_headers = $db->query($sql);
*/

/*
echo "<pre class='text-left'>";
print_r($result);
echo "</pre>";
*/

mysqli_close( $db );

//echo $headers = $table_headers->fetch_row();

/*
 * while (list($header) = $table_headers->fetch_row()) {
 *   echo "<th>$header</th>";
 * }
*/


// Here Doc
$table = <<<END_OF_TABLE
<h1>This will be a listing of Restaurants</h1>

<hr/>

<table class="table text-left table-hover">
  <thead>
    <tr>
    <th>ID</th>
      <th>Name</th>
      <th>Location</th>
      <th>Price Range Low</th>
      <th>Price Range High</th>
      <th>Tags</th>
      <th>Modified At</th>
      <th>Created At</th>
    </tr>
  </thead>
  <tbody>  
END_OF_TABLE;

echo $table;

  while (list($id, $name, $location, $priceRangeLow, $priceRangeHigh, $tags, $modifiedAt, $createdAt) = $result->fetch_row()) {
    echo "<tr>\n",
        "\t<th scope='row'>" . $id . "</th>\n",
        "\t<td><a href='restaurant.php?id=$id'>" . $name . "</a></td>\n",
        "\t<td>" . $location . "</td>\n",
        "\t<td>" . $priceRangeLow . "</td>\n",
        "\t<td>" . $priceRangeHigh . "</td>\n",
        "\t<td>" . $tags . "</td>\n",
        "\t<td>" . $modifiedAt . "</td>\n",
        "\t<td>" . $createdAt . "</td>\n",
        "<tr>\n";
  }

  //echo "no more records";

  ?>
  </tbody>
</table>

<?php

include 'includes/footer.php';

?>
