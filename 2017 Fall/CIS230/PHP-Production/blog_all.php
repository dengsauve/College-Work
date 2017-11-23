<?php
/**
 * Created by PhpStorm.
 * User: dengs
 * Date: 11/22/2017
 * Time: 3:22 AM
 */

$title = "All Blogs";

include 'includes/functions.php';
include 'includes/header.php';

$db = db_connect();

$delete_id = $_GET["id"];
if( !empty($delete_id) ){
  // Create SQL query to delete blog with passed id
  $sql = "delete from blogs where `blogs_id`=$delete_id";
  //Execute the query
  $result = $db->query($sql);
}

$sql = "select * from blogs";

$result = $db->query($sql);

$tableHead = <<<END_OF_TABLE_HEAD
<h2>$title</h2>
<hr />

<div class="table-responsive">
  <table class="table text-left">
    <thead>
      <tr>
        <th>Title</th>
        <th>Author</th>
        <th>Date</th>
        <th></th>
      </tr>
    </thead>
    <tbody>  

END_OF_TABLE_HEAD;

echo $tableHead;

while( list($id, $title, $author, $date, $text) = $result->fetch_row() ){
  echo "<tr>\n";
  echo "<td><a href='blog_show.php?id=$id'>" . $title . "</a></td>";
  echo "<td>$author</td><td>$date</td>";
  echo "<td class='text-right'><a href='blog_update.php?id=$id' class='btn btn-info btn-xs'>Update</a>";
  echo " <a href='blog_all.php?id=$id' class='btn btn-danger btn-xs'>Delete</a></td>";
  echo "</tr>\n";
}

echo "</tbody>\n</table>\n</div>";
echo "<a href=\"blog_new.php\" class=\"btn btn-success pull-left\">Create New Post</a>";

include 'includes/footer.php';