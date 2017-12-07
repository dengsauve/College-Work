<?php
/**
 * Created by PhpStorm.
 * User: dengs
 * Date: 12/6/2017
 * Time: 8:53 PM
 */

ob_start();

include 'includes/header.php';

if( !empty($_SESSION['user']) && !empty($_GET['id']) )
{
  include 'includes/functions.php';

  $db = db_connect();

  // Grab all subscribers emails
  $sql = "select email_address from subscribers where subscribed=true";
  $result = $db->query($sql);

  // Grab blog to send
  $blogID = mysqli_real_escape_string($db, $_GET['id']);
  $sql = "select title, blog_text from blogs where blogs_id='$blogID'";
  list($blogTitle, $blog) = $db->query($sql)->fetch_row();

  // Send newsletter to subscribers
  $to = "dengsauve@yahoo.com";
  $subject = $blogTitle;
  $message = $blog;
  $headers = "From: DS Newsletter <phpprod@dennissauve.com>\r\n";

  // add subscribers to mail list
  while( list($email) = $result->fetch_row() ){
    $to .= ', ' . $email;
  }

  // Send the emails
  $sent = mail( $to, $subject, $message, $headers );
  if($sent == 1){
    $sent_message = '<p class="help-block">Newsletter was sent!</p>';
  }
  else{
    $sent_message = '<p class="help-block">Newsletter was not sent!</p>';
  }

}
else
{
  // redirect non-admins
  ob_clean();
  header("Location: /");
}

echo $sent_message;
echo "<a href='blog_all.php' class='btn btn-primary'>Return to Blogs</a>";

include 'includes/footer.php';