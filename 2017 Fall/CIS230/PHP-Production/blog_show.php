<?php
/**
 * Created by PhpStorm.
 * User: Dennis
 * Date: 11/22/2017
 * Time: 1:28 PM
 */

include 'includes/functions.php';
include 'includes/header.php';

$db = db_connect();

if( !empty($_POST['submit']) ){
  $blogIDFK = mysqli_real_escape_string( $db, $_POST['id'] );
  $author = mysqli_real_escape_string( $db, $_POST['author'] );
  $rating = mysqli_real_escape_string( $db, $_POST['rating'] );
  $blog_comment = mysqli_real_escape_string( $db, $_POST['blogComment'] );

  $error_found = false;

  if( empty($author) || empty($rating) || empty($blog_comment) ){
    $error_found = true;
  }

  if( !$error_found ){
    $sql = "insert into blog_comments (comment_id, blogFKID, blog_comment, rating, author, created) values (null, '$blogIDFK', '$blog_comment', '$rating', '$author', null)";

    $result = $db->query($sql);
  }
}

$id = mysqli_real_escape_string($db, $_GET["id"]);
$sql = "select * from blogs where `blogs_id`=$id";

$result = $db->query($sql);
list($id, $title, $author, $date, $text ) = $result->fetch_row();

$fsql = $_GET['sql'];

?>

  <div class="col-xs-12 col-md-8 col-md-offset-2">
    <h1>Blog</h1>

    <hr/>

    <div class="well text-left">
      <?php
      echo "<h3>$title</h3>";
      echo "<h5>by: $author</h5>";
      echo "<p>" . nl2br($text) . "</p>";
      ?>
    </div>

    <div class="col-xs-12">
      <?php echo "<a href='blog_update.php?id=$id' class='btn btn-info pull-left' id='create-post-button'>Update Post</a>"; ?>
      <a href="blog_all.php" class="btn btn-default pull-left" id="see-posts-button">Back</a>
    </div>

  <h2>Comments -

    <?php
    $sql = "select ROUND(AVG(rating)) from blog_comments where blogFKID=$id";
    $average = $db->query($sql)->fetch_row()[0];
    if(empty($average)){
      $average = 0;
    }

    for($i=0; $i<$average; $i++){
      echo "<img src='images/star.png' class='review-star'/>";
    }

    echo "</h2>";
    $sql = "select * from blog_comments where blogFKID='$id' order by created asc";
    $result = $db->query($sql);

    echo "<div class='col-xs-12'>";
    while( list($comment_id, $blogIDFK, $blog_comment, $rating, $author, $created) = $result->fetch_row() ){
      $comment = nl2br($blog_comment);
      $starString = '';
      for($i=0; $i < $rating; $i++){$starString .= "<img src='images/star.png' class='review-star-sm' />";}
      $timeAgoWords = time_elapsed_string($created);

      $comment_section = <<<END_OF_COMMENT
<section class="panel panel-default text-left">
  <div class="panel-heading">
    <h4>$author - $starString</h4>
    <p>$timeAgoWords</p>
  </div>
  <div class="panel-body">
    $comment
  </div>
</section>
END_OF_COMMENT;
      echo $comment_section;
    }

    $formAction = "blog_show.php?id=$id";

    include 'includes/blogCommentForm.php';

  echo "</div></div>";

include 'includes/footer.php';

?>