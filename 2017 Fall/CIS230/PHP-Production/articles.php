<?php

$title = "Articles";
include 'includes/header.php';
include 'includes/functions.php';

$db = db_connect();

$sql = "select * from articles order by modified_at DESC LIMIT 1";

$result = $db->query($sql);

mysqli_close( $db );

list($id, $name, $author, $article_text, $published_date, $created_at, $modified_at) = $result->fetch_row();

$timeAgoWords = time_elapsed_string($published_date);

$detail = <<<END_OF_DETAIL

<h1>Articles</h1>

<hr />

<article class="col-xs-12 well">
  <h2>$name</h2>
  <p>By: $author, $timeAgoWords</p>
  <p class="text-justify">$article_text</p>
  <p>Published On: $published_date</p>
  <p>Created On: $created_at</p>
  <p>Last Modified: $modified_at</p>
</article>
<a href="restaurant_edit.php?id=$id" class="btn btn-info btn-sm">Edit This Article!</a>
<a href="restaurants.php" class="btn btn-default btn-sm">See All Articles</a>

END_OF_DETAIL;

echo $detail;

include 'includes/footer.php';

?>
