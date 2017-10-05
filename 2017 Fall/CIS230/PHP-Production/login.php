<?php

$title = "Login";
include 'includes/header.php';

$email = $_POST['email'];
$pwd = $_POST['pwd'];
$remember = $_POST['remember'];
$rememberChecked = $remember == "remember" ? 'checked="Checked"' : '';

$remembered = false;
if ($remember=="remember"){
  $remembered = true;
}


?>

<h1>Login</h1>

  <form class="text-left col-md-6 col-md-offset-3" method="post">
    <div class="form-group">
      <label for="email">Email address:</label>
      <input type="email" class="form-control" id="email" name="email" value="<?php echo ($remembered ? $email : ''); ?>">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pwd" value="<?php echo ($remembered ? $pwd : ''); ?>">
    </div>
    <div class="form-group">
      <label for="remember">Remember me</label>
      <input type="checkbox" id="remember" name="remember" value="remember" <?php echo $rememberChecked; ?> >
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>

<?php

include 'includes/footer.php';

?>