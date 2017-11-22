<?php

$todaysDate = date('Y-m-d H:n:s');

if( empty($datePosted) ){
  $datePosted = $todaysDate;
}

$newForm = <<<END_OF_EDIT_FORM


<form action="$formAction" method="post" class="text-left">
  <input type="hidden" name="id" value="$id">
  
  <section class="form-group">
    <label for="title">Blog Title</label>
    <input type="text" name="title" class="form-control" value="$title"/>
    <p class="help-block">$titleError</p>
  </section>
  
  <section class="form-group">
    <label for="author">Author</label>
    <input type="text" name="author" class="form-control" value="$author"/>
    <p class="help-block">$authorError</p>
  </section>
  
  <section class="form-group">
    <label for="published">Date Posted</label>
    <input type="text" name="published" class="form-control" value="$datePosted"/>
    <p class="help-block">$publishedError</p>
  </section>
  
  <section class="form-group">
    <label for="blogText">Blog Entry</label>
    <textarea class="form-control article-text" name="blogText" >$blogText</textarea>
    <p class="help-block">$blogTextError</p>
  </section>
  
  <input type="submit" name="submit" value="Save Changes" class="btn btn-primary">
  <a href="article.php?id=$id" class="btn btn-default">Cancel</a>
  
</form>

END_OF_EDIT_FORM;

echo $newForm;
