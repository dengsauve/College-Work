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

// Handle Phone Input Data
$phone = $_POST['phone'];

//Handle Question Input Data
$question = $_POST['question'];

// Handle Contact Data
$contactBy = $_POST['contactBy'];

// Handle Products Selection Data
$products = array("Watermelon Wedge", "Watermelon", "Watermelons");
$product = $_POST['product'];

// Handle Newsletter Subscription Data
$newsletter = $_POST['newsletter'];
$newsletter_subscribed = '';
if ($newsletter == "subscribed"){
  $newsletter_subscribed = "checked=\"checked\"";
}

// Handle New Production Subscription Data
$new_products = $_POST['new_products'];
$new_products_subscribed = '';
if ($new_products == "subscribed"){
  $new_products_subscribed = "checked=\"checked\"";
}

?>

<form action="/contactus.php" method="post" class="text-left col-md-6 col-md-offset-3">

  <div class="form-group">

    <label for="name">Name:</label>
    <input type="text" name="name" id="name" class="form-control" value="<?php echo $name; ?>">
    <?php echo $name_error; ?>

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" class="form-control" value="<?php echo $email; ?>">
    <?php echo $email_error; ?>

    <label for="phone">Phone Number:</label>
    <input type="tel" name="phone" id="phone" class="form-control" value="<?php echo $phone; ?>">

  </div>

  <div class="form-group">

    <label for="question">Question:</label>
    <textarea name="question" id="question" class="form-control" rows="3"><?php echo $question; ?></textarea>

  </div>

  <div class="radio">

    <label>
      <input type="radio" value="contactPhone" name="contactBy" id="phone" <?php echo ($contactBy == 'contactPhone' ? 'checked' : '') ?> >
      <strong>Contact Me By Phone</strong>
    </label>

  </div>

  <div class="radio">

    <label>
      <input type="radio" value="contactEmail" name="contactBy" id="email" <?php echo ($contactBy == 'contactEmail' ? 'checked' : '') ?> >
      <strong>Contact Me By Email</strong>
    </label>

  </div>

  <label for="restaurant">Choose a Restaurant</label>

  <?php

  CreateSelectBox("product", $products, $product)

  ?>

  <div class="checkbox">

    <label for="newsletter">
      <input type="checkbox" value="subscribed" name="newsletter" id="newsletter" <?php echo $newsletter_subscribed; ?> >
      <strong>Subscribed to Newsletter</strong>
    </label>

  </div>

  <div class="checkbox">

    <label for="new_products">
      <input type="checkbox" value="subscribed" name="new_products" id="new_products" <?php echo $new_products_subscribed; ?> >
      <strong>Notify me when new products are added</strong>
    </label>

  </div>

  <input type="submit" name="submit" value="Ask a Question" class="btn btn-primary">
  
</form>
