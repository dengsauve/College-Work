<?php

$newForm = <<<END_OF_EDIT_FORM

<div class="col-md-6 col-md-offset-3">
<form action="$formAction" method="post">
  <input type="hidden" name="id" value="$id">
  
  <section class="form-group">
    <label for="title">Article Title</label>
    <input type="text" name="title" class="form-control" value="$title"/>
    <p class="help-block">$titleError</p>
  </section>
  
  <section class="form-group">
    <label for="author">Author</label>
    <input type="text" name="author" class="form-control" value="$author"/>
    <p class="help-block">$authorError</p>
  </section>
  
  <section class="form-group">
    <label for="published">Published Date</label>
    <input type="text" name="published" class="form-control" value="$published"/>
    <p class="help-block">$publishedError</p>
  </section>
  
  <section class="form-group">
    <label for="articleText">Article Text</label>
    <textarea class="form-control article-text" name="articleText" >$articleText</textarea>
    <p class="help-block">$articleTextError</p>
  </section>
  
  <input type="submit" name="submit" value="Save Changes" class="btn btn-primary">
  <a href="article.php?id=$id" class="btn btn-default">Cancel</a>
  
</form>

</div>

END_OF_EDIT_FORM;
echo $newForm;
