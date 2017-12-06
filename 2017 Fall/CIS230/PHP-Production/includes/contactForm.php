<?php
/**
 * Created by PhpStorm.
 * User: Dennis
 * Date: 10/14/2017
 * Time: 10:21 AM
 */

include 'functions.php';

$submit = $_POST['submit'];

// Handle Name Input Data
$name = $_POST['name'];
$name_error = '';
if (empty($name) && !empty($submit)){
  $name_error = '<p class="help-block">Please enter a name</p>';
}

// Handle Email Input Data
$email = $_POST['email'];
$email_error = '';
if (empty($email) && !empty($submit)){
  $email_error = '<p class="help-block">Please enter an email address</p>';
}

//Handle Question Input Data
$question = $_POST['question'];

?>

<form action="/contactus.php" method="post" class="text-left col-md-6 col-md-offset-3">

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
