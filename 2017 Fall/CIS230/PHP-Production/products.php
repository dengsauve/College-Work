<?php

$title = "Products";
include 'includes/header.php';
include 'includes/functions.php';

//  Name, Description, Price, Cost, Qty On Hand, Image, Thumbnail Image


$page_head = <<<END_OF_PAGE_HEAD

<h1>Products</h1>
<hr/>

<div class="table-responsive">
  <table class="table text-left">
    <thead>
      <tr>
        <th>id</th>
        <th>Image</th>
        <th>Name</th>
        <th>Description</th>
        <th class="text-right">Price</th>
        <th class="text-right">Cost</th>
        <th class="text-right">Qty.</th>
      </tr>
    </thead>
    <tbody>

END_OF_PAGE_HEAD;

echo $page_head;


$db = db_connect();
$sql = "select * from products";
$result = $db->query($sql);

while( list($id, $name, $description, $price, $cost, $quantity, $image, $thumbnail) = $result->fetch_row() )
{
  echo "
      <tr>
        <td>$id</td>
        <td><img src='$thumbnail' alt='thumbnail' class='product-thumb' /></td>
        <td>$name</td>
        <td>$description</td>
        <td class='text-right'>$$price</td>
        <td class='text-right'>$$cost</td>
        <td class='text-right'>$quantity</td>
      </tr>
  ";
}

$page_foot = <<<END_OF_PAGE_FOOT

    </tbody>
  </table>
</div>

END_OF_PAGE_FOOT;

echo $page_foot;

include 'includes/footer.php';

?>