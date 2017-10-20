<?php

$title = 'Restaurants';
include 'includes/header.php';
include 'includes/functions.php';

$db = db_connect();

$sql = "select * from restaurants";

$result = $db->query($sql);

echo "<pre class='text-left'>";
print_r($result);
echo "</pre>";

mysqli_close( $db );

?>

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
  <?php

  while (list($id, $name, $location, $priceRangeLow, $priceRangeHigh, $tags, $modifiedAt, $createdAt) = $result->fetch_row()) {
    echo "<tr>\n";
    echo "\t<th scope='row'>" . $id . "</th>\n",
        "\t<td>" . $name . "</td>\n",
        "\t<td>" . $location . "</td>\n",
        "\t<td>" . $priceRangeLow . "</td>\n",
        "\t<td>" . $priceRangeHigh . "</td>\n",
        "\t<td>" . $tags . "</td>\n",
        "\t<td>" . $modifiedAt . "</td>\n",
        "\t<td>" . $createdAt . "</td>\n";
    echo "<tr>\n";
  }

  //echo "no more records";

  ?>
  </tbody>
</table>

<?php

include 'includes/footer.php';

?>
