<?php

session_start();

$title = "Login";
include 'includes/header.php';
include 'includes/functions.php';

$db = db_connect();

// get data
if( !empty($_POST["submit"]) ) {
  $email = mysqli_real_escape_string($db, $_POST['email']);
  $pwd = mysqli_real_escape_string($db, $_POST['pwd']);
  $remember = mysqli_real_escape_string($db, $_POST['remember']);
  $rememberChecked = $remember == "remember" ? 'checked="Checked"' : '';

  $_SESSION["email"] = $email;
}



?>

<h1>Login</h1>

  <form class="text-left col-md-6 col-md-offset-3" method="post" action="login.php">
    <div class="form-group">
      <label for="email">Email address:</label>
      <input type="email" class="form-control" id="email" name="email" value="<?php echo ($remembered ? $email : ''); ?>">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input disabled type="password" class="form-control" id="pwd" name="pwd" value="<?php echo ($remembered ? $pwd : ''); ?>">
    </div>
    <div class="form-group">
      <label for="remember">Remember me</label>
      <input type="checkbox" id="remember" name="remember" value="remember" <?php echo $rememberChecked; ?> >
    </div>
    <input type="submit" name="submit" value="login" class="btn btn-primary">
  </form>

<?php

include 'includes/footer.php';

?>