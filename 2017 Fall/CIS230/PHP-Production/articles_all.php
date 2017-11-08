<?php

$title = 'Article List';
include 'includes/functions.php';
include 'includes/header.php';

$db = db_connect();

$sql = "select * from articles";

$result = $db->query($sql);


$tableTop = <<<END_OF_TABLE_TOP
<h1>Article List</h1>
<hr/>

<table class="table text-left">
  <thead>
    <tr>
      <th>Title</th>
      <th>Author</th>
      <th>Published Date</th>
      <th>Controls</th>
    </tr>
  </thead>
  <tbody>

END_OF_TABLE_TOP;
echo $tableTop;

//generate list of articles

while( list($id, $title, $author, $articleText, $published, $created, $modified) = $result->fetch_row() ){
  echo "<tr>
          <td>$title</td>
          <td>$author</td>
          <td>$published</td>
          <td>
            <a class='btn btn-info btn-sm' href='article_edit.php?id=$id'>Edit</a>
            <a class='btn btn-danger btn-sm'>Delete</a>
          </td>
        </tr>";
}



echo "</table>";
include 'includes/footer.php';
