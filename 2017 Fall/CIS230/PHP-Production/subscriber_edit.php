<?php
/**
 * Created by PhpStorm.
 * User: dennis
 * Date: 12/7/17
 * Time: 11:00 PM
 */

ob_start();

include 'includes/header.php';

if( empty($_SESSION['user']) ){
  ob_clean();
  header('Location: /');
  exit;
}

include 'includes/functions.php';

$db = db_connect();

$firstName = mysqli_real_escape_string($db, $_POST['firstName']);
$lastName = mysqli_real_escape_string($db, $_POST['lastName']);
$email = mysqli_real_escape_string($db, $_POST['email']);
$subscribe = mysqli_real_escape_string($db, $_POST['subscribe']);
$subscribed = $subscribe == "checked";

$id = mysqli_real_escape_string($db, $_GET['id']);
$sql = "select * from subscribers where subscriber_id='$id'";
$result = $db->query($sql);

list($id, $first, $last, $email, $sub) = $result->fetch_row();

$edit_form = <<<END_OF_EDIT_FORM

<h3>Edit Subscriber</h3>
<hr/>

<div class="col-md-6 col-md-offset-3">
  <form class="text-left">
    <div class="form-group">
      <label for="first">First Name:</label>
      <input type="text" class="form-control" name="first" value="$first" required>
    </div>
    
    <div class="form-group">
      <label for="last">Last Name:</label>
      <input type="text" class="form-control" name="last" value="$last" required>
    </div>
    
    <div class="form-group">
      <label for="email">E-mail Address:</label>
      <input type="email" class="form-control" name="email" value="$email" required>
    </div>
    
    <div class="checkbox">
      <label>
        <input type="checkbox" value="">
        Subscribed
      </label>
    </div>
    
    <button type="submit" name="submit" value="submit" class="btn btn-primary">Update Subscriber</button>
  </form>
</div>

END_OF_EDIT_FORM;

echo $edit_form;