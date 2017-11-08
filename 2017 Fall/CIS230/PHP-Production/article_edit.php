<?php

ob_start();

$title = 'Edit Article';

include 'includes/functions.php';
include 'includes/header.php';

// Get the article's information from database
$db = db_connect();
$id = $_GET["id"];
$sql = "select * from articles where article_id=$id";
$result = $db->query($sql);
list($id, $title, $author, $articleText, $published, $created, $modified) = $result->fetch_row();

if( !empty($_POST['submit']) ){
  // Get variables
  $id = $_POST['id'];
  $title = $_POST['title'];
  $author = $_POST['author'];
  $articleText = $_POST['articleText'];
  $published = $_POST['published'];

  // check for errors
  $errorsFound = false;

  if( empty($title) ){
    $errorsFound = true;
    $titleError = 'Title is required!';
  }

  if( empty($author) ){
    $errorsFound = true;
    $authorError = 'Author is required!';
  }

  if( empty($articleText) ){
    $errorsFound = true;
    $articleTextError = 'Article text is required!';
  }

  if( empty($published) ){
    $errorsFound = true;
    $publishedError = 'Published Date is required!';
  }

  if( DateTime::createFromFormat('Y-m-d H:i:s', $published) === FALSE ){
    $errorsFound = true;
    $publishedError = 'Published Date must match the format YYYY-MM-DD hh:mm:ss';
  }

  if( !$errorsFound ) {
    // Update Query
    $sql = "update articles set title='$title',
                                author='$author',
                                article_text='$articleText',
                                published_date='$published',
                                modified_at=CURRENT_TIMESTAMP
                                where article_id='$id'";

    $result = $db->query($sql);

    ob_clean();
    header("Location: /article.php?id=$id");
    exit;
  }
}


$formAction = "article_edit.php?id=$id";
include 'includes/articleForm.php';

include 'includes/footer.php';