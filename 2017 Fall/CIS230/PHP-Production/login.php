<?php

ob_start();
session_start();

$title = "Login";
include 'includes/header.php';
include 'includes/functions.php';

$db = db_connect();

// get data
if( !empty($_POST["submit"]) ) {
  $email = mysqli_real_escape_string($db, $_POST['email']);
  $password = mysqli_real_escape_string($db, $_POST['pwd']);
  $remember = mysqli_real_escape_string($db, $_POST['remember']);

  // check password on email
  $sql = "select * from users where email='$email'";
  $result = $db->query($sql);
  list($id, $email, $name, $password_crypt) = $result->fetch_row();

  if( password_verify($password, $password_crypt) ){
    $_SESSION["email"] = $email;
    $_SESSION["user"] = $name;

    //redirect to the top page
    ob_clean();
    header("Location: /");
  }else{
    $error_message = "Unknown Credentials - Please Try Again";
  }
}

//echo password_hash("424242", PASSWORD_DEFAULT);

?>

<h1>Login</h1>
<hr/>

<p class="help-block"><?php echo $error_message; ?></p>
  <form class="text-left col-md-6 col-md-offset-3" method="post" action="login.php">
    <div class="form-group">
      <label for="email">Email address:</label>
      <input type="email" class="form-control" id="email" name="email" value="<?php echo ($remembered ? $email : ''); ?>">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pwd" value="<?php echo ($remembered ? $pwd : ''); ?>">
    </div>
    <input type="submit" name="submit" value="login" class="btn btn-primary">
  </form>

<?php

include 'includes/footer.php';

ob_flush();
?>