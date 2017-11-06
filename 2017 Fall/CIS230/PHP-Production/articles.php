<?php

$title = "Articles";
include 'includes/header.php';
include 'includes/functions.php';

$db = db_connect();

$sql = "select * from articles order by modifiedAt DESC LIMIT 1";

$result = $db->query($sql);

mysqli_close( $db );

list($id, $name, $author, $article_text, $published_date, $created_at, $modified_at) = $result->fetch_row();


$detail = <<<END_OF_DETAIL

<h1>Articles</h1>

<p>This is a page that shows one restaurants details.</p>

<h2>$name</h2>
<p>$author</p>
<p>$article_text</p>
<p>$published_date</p>
<p>$created_at</p>
<p>$modified_at</p>

<a href="restaurant_edit.php?id=$id" class="btn btn-info btn-sm">Edit This Restaurant!</a>
<a href="restaurants.php" class="btn btn-default btn-sm">See All Restaurants</a>

END_OF_DETAIL;

echo $detail;

include 'includes/footer.php';

?>
