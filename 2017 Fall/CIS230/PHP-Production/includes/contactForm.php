<?php
/**
 * Created by PhpStorm.
 * User: Dennis
 * Date: 10/14/2017
 * Time: 10:21 AM
 */

include 'functions.php';

$allClear = true;
$sent_message = '';
$submit = $_POST['submit'];

if( empty($submit) ){
  $allClear = false;
}

// Handle Name Input Data
$name = $_POST['name'];
$name_error = '';
if (empty($name) && !empty($submit)){
  $name_error = '<p class="help-block">Please enter a name</p>';
  $allClear = false;
}

// Handle Email Input Data
$email = $_POST['email'];
$email_error = '';
if (empty($email) && !empty($submit)){
  $email_error = '<p class="help-block">Please enter an email address</p>';
  $allClear = false;
}

//Handle Question Input Data
$question = $_POST['question'];

if( $allClear ){

  // Send questions to admin
  $to = "dengsauve@yahoo.com";
  $subject = "Question From $name";
  $message = $question;
  $headers = "From: Prod Questions <phpprod@dennissauve.com>\r\n";
  // add a blind carbon copy
  //$headers .= "BCC: dave.jones@SCC.SPOKANE.EDU\r\n";

  $sent = mail( $to, $subject, $message, $headers );
  if($sent == 1){
    $sent_message = '<p class="help-block">Question was sent!</p>';
  }
  else{
    $sent_message = '<p class="help-block">Question was not sent!</p>';
  }

  // Send the Thank you email!
  $to = $email;
  $subject = "Thank you for your Question";
  $message = "$name, Your question is very important to us. We'll be sure to respond to you within a timely manner.";
  $headers = "From: Prod Questions <phpprod@dennissauve.com>\r\n";

  $sent = mail( $to, $subject, $message, $headers );

}


?>

<form action="/contactus.php" method="post" class="text-left col-md-6 col-md-offset-3">
  <?php echo $sent_message; ?>
  <hr/>

  <div class="form-group">

    <label for="name">Name:</label>
    <input type="text" name="name" id="name" class="form-control" value="<?php echo $name; ?>">
    <?php echo $name_error; ?>

  </div>
  <div class="form-group">

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" class="form-control" value="<?php echo $email; ?>">
    <?php echo $email_error; ?>

  </div>

  <div class="form-group">

    <label for="question">Question:</label>
    <textarea name="question" id="question" class="form-control" rows="3"><?php echo $question; ?></textarea>

  </div>

  <input type="submit" name="submit" value="Ask a Question" class="btn btn-primary">

</form>
