<?php
/**
 * Created by PhpStorm.
 * User: Dennis
 * Date: 11/22/2017
 * Time: 3:16 PM
 */


$todaysDate = date('Y-m-d H:n:s');

$newForm = <<<END_OF_EDIT_FORM


<form action="$formAction" method="post" class="text-left">
  <input type="hidden" name="id" value="$id">
  
  <section class="form-group">
    <label for="author">Author</label>
    <input type="text" name="author" class="form-control" value="$author"/>
    <p class="help-block">$authorError</p>
  </section> 
  
  <section class="form-group">
    <label for="author">Rating</label>
    <select name="rating" class="form-control" value="$rating">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </section> 
  
  <section class="form-group">
    <label for="blogText">Comment</label>
    <textarea class="form-control article-text" name="blogComment" >$blogComment</textarea>
    <p class="help-block">$blogCommentError</p>
  </section>
  
  <input type="submit" name="submit" value="Comment" class="btn btn-primary" id="comment-button">
  
</form>

END_OF_EDIT_FORM;

echo $newForm;
