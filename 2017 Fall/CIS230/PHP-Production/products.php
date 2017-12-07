<?php

$title = "Products";
include 'includes/header.php';
include 'includes/functions.php';

//  Name, Description, Price, Cost, Qty On Hand, Image, Thumbnail Image


$page_head = <<<END_OF_PAGE_HEAD

<h1>Products</h1>
<hr/>

<div class="col-xs-12">
  <a href="product_new.php" class="btn btn-success pull-left">Add New Product</a>
</div>
<div class="table-responsive col-xs-12">
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
        <th></th>
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
        <td><a href='product.php?id=$id'>$name</a></td>
        <td>$description</td>
        <td class='text-right'>$$price</td>
        <td class='text-right'>$$cost</td>
        <td class='text-right'>$quantity</td>
  ";
  if( !empty($_SESSION['user']) )
  {
    echo "<td>
            <a href='product_edit.php?id=$id' class='btn btn-info btn-xs'>Update</a> 
            <a href='product_delete.php?id=$id' class='btn btn-danger btn-xs'>Delete</a>
          </td>";
  }
  echo "</tr>";
}

$page_foot = <<<END_OF_PAGE_FOOT

    </tbody>
  </table>
</div>

END_OF_PAGE_FOOT;

echo $page_foot;

include 'includes/footer.php';

?>