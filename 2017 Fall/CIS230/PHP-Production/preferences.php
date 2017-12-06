<?php

include 'includes/functions.php';

// first/last name, email address, newsletter?

if( !empty($_POST['submit']) )
{
  $db = db_connect();

  $firstName = mysqli_real_escape_string($db, $_POST['firstName']);
  $lastName = mysqli_real_escape_string($db, $_POST['lastName']);
  $email = mysqli_real_escape_string($db, $_POST['email']);
  $subscribe = mysqli_real_escape_string($db, $_POST['subscribe']);

  $noErrors = true;

  if(empty($firstName)){
    $noErrors = false;
    $firstNameError = '<p class="help-block">Must enter a first name</p>';
  }

  if(empty($lastName)){
    $noErrors = false;
    $lastNameError = '<p class="help-block">Must enter a last name</p>';
  }

  if(empty($email)){
    $noErrors = false;
    $emailError = '<p class="help-block">Must enter an email</p>';
  }

  if($noErrors)
  {
    
  }
}

$title = "Preferences";
include 'includes/header.php';
?>

<h1>Preferences</h1>

<hr/>

<?php

$subscribeForm = <<<END_OF_FORM

<form class="text-left col-md-6 col-md-offset-3" action="preferences.php" method="post">
  
  <div class="form-group">
    <label for="firstName">First Name:</label>
    <input type="text" class="form-control" name="firstName" value="$firstName">
    $firstNameError
  </div>
  
  <div class="form-group">
    <label for="lastName">Last Name:</label>
    <input type="text" class="form-control" name="lastName" value="$lastName">
    $lastNameError
  </div>
  
  <div class="form-group">
    <label for="lastName">E-Mail:</label>
    <input type="email" class="form-control" name="email" value="$email">
    $emailError
  </div>
  
  <div class="checkbox">
    <label>
      <input type="checkbox" name="subscribe" value="checked" $subscribe>
      Subscribe to our Newsletter
    </label>
  </div>

  <button name="submit" value="submit" class="btn btn-success">Subscribe!</button>
</form>

END_OF_FORM;

echo $subscribeForm;

include 'includes/footer.php';

?>

