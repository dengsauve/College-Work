<?php

ob_start();

$title = 'New Article';

include 'includes/functions.php';
include 'includes/header.php';

$title='';

$published = date('Y-m-d H:i:s');

if( !empty($_POST['submit']) ){
  // Get variables
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
    // Connect to db
    $db = db_connect();
    // Insert new record Query
    $sql = "insert into articles (article_id, title, author, article_text, published_date, created_at, modified_at)
                        values (null, '$title', '$author', '$articleText', '$published', current_timestamp, current_timestamp)";
    // Execute Query
    $result = $db->query($sql);
    // Grab id of record created
    $id = $db->insert_id;
    // Redirect
    ob_clean();
    header("Location: /article.php?id=$id");
    exit;
  }
}

$formAction = 'article_new.php';
include 'includes/articleForm.php';

include 'includes/footer.php';