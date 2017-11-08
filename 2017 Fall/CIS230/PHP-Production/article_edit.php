<?php

ob_start();

include 'includes/functions.php';
include 'includes/header.php';

// Get the article's information from database
$db = db_connect();

if( !empty($_POST['submit']) ){
  // Get variables
  $id = $_POST['id'];
  $title = $_POST['title'];
  $author = $_POST['author'];
  $articleText = $_POST['articleText'];
  $published = date('Y-m-d H:i:s' ,$_POST['Published']);

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



$id = $_GET["id"];
$sql = "select * from articles where article_id=$id";
$result = $db->query($sql);
list($id, $title, $author, $articleText, $published, $created, $modified) = $result->fetch_row();


$editForm = <<<END_OF_EDIT_FORM

<div class="col-md-6 col-md-offset-3">
<form action="article_edit.php" method="post">

  <input type="hidden" name="id" value="$id"/>
  
  <section class="form-group">
    <label for="title">Article Title</label>
    <input type="text" name="title" class="form-control" value="$title"/>
  </section>
  
  <section class="form-group">
    <label for="author">Author</label>
    <input type="text" name="author" class="form-control" value="$author"/>
  </section>
  
  <section class="form-group">
    <label for="published">Published Date</label>
    <input type="text" name="published" class="form-control" value="$published"/>
  </section>
  
  <section class="form-group">
    <label for="articleText">Article Text</label>
    <textarea class="form-control" name="articleText" >$articleText</textarea>
  </section>
  
  <input type="submit" name="submit" value="Save Changes" class="btn btn-primary">
  <a href="article.php?id=$id" class="btn btn-default">Cancel</a>
  
</form>

</div>

END_OF_EDIT_FORM;
echo $editForm;


















include 'includes/footer.php';