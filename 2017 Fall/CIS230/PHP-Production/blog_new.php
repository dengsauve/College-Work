<?php

$title = "Blog";

ob_start();

include 'includes/functions.php';
include 'includes/header.php';

$title='';

$published = date('Y-m-d H:i:s');

if( !empty($_POST['submit']) ){
  // Get variables
  $title = $_POST['title'];
  $author = $_POST['author'];
  $blogText = $_POST['blogText'];
  $datePosted = $_POST['published'];

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

  if( empty($blogText) ){
    $errorsFound = true;
    $articleTextError = 'Article text is required!';
  }

  if( empty($datePosted) ){
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
    $sql = "insert into blogs (blogs_id, title, author, datePosted, blog_text)
                        values (null, '$title', '$author', '$datePosted', '$blogText')";
    // Execute Query
    $result = $db->query($sql);
    // Grab id of record created
    $id = $db->insert_id;
    // Redirect
    ob_clean();
    header("Location: /blog.php");
    exit;
  }
}



$formAction = 'blog_new.php';

?>

<div class="col-xs-12 col-md-8 col-md-offset-2">
  <h1>Blog</h1>

  <hr/>



  <?php
  include 'includes/blogForm.php';
  ?>

</div>
<?php

include 'includes/footer.php';

?>
