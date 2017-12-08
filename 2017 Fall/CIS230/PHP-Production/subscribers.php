<?php
/**
 * Created by PhpStorm.
 * User: dennis
 * Date: 12/7/17
 * Time: 10:31 PM
 */

ob_start();

include 'includes/header.php';

if( empty($_SESSION['user']) ){
  ob_clean();
  header('Location: /');
  exit;
}

include 'includes/functions.php';

$table_head = <<<END_OF_TABLE_HEAD

<div class="table-responsive">
  <table class="table text-left">
    <thead>
      <tr>
        <th>id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Subscribed</th>
        <th class="text-right">Controls</th>
      </tr>
    </thead>
    <tbody>

END_OF_TABLE_HEAD;

echo $table_head;

$db = db_connect();
$sql = "select * from subscribers";
$result = $db->query($sql);

while( list($id, $first, $last, $email, $subscribed) = $result->fetch_row() )
{
  echo '<tr>';
  echo "
    <td>$id</td>
    <td><a href='subscriber_edit.php?id=$id'>$first $last</a></td>
    <td>$email</td>
  ";
  echo '<td>' . ($subscribed == 1 ? 'yes' : 'no') . '</td>';
  echo "<td class='text-right'><a href='subscriber_delete.php?id=$id' class='btn btn-danger btn-xs'>Delete</a></td>";
  echo '</tr>';
}

echo '</tbody></table>';


include 'includes/footer.php';


