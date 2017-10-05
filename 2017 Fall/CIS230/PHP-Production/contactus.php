<?php

  $title = "Contact Us";
  include 'includes/header.php';
  include 'includes/functions.php';

  $name = $_POST['name'];
  $email = $_POST['email'];
  $question = $_POST['question'];
  $newsletter = $_POST['newsletter'];
  $blog = $_POST['blog'];
  $contactBy = $_POST['contactBy'];
  $newsletterSubscribed = '';
  $blogSubscribed = '';
  $restaurant = $_POST['restaurant'];


  if ($newsletter == "subscribed"){
    $newsletterSubscribed = "checked=\"checked\"";
  }

  if ($blog == "subscribed"){
    $blogSubscribed = "checked=\"checked\"";
  }

  $num1 = $_POST['num1'];
  $num2 = $_POST['num2'];
  $num3 = $_POST['num3'];
  $sum = $num1 + $num2 + $num3;

  //echo "Num1: $num1   Num2: $num2   Nun3: $num3 <br/>";
  //echo "The sum of num1 and num2 is $sum <br/>";
  //echo "Newsletter: $newsletter <br/>";
  //echo "Contact By: $contactBy";
  //echo "Restaurant: $restaurant";

  $restaurants = array("Chinese", "American", "Italian", "Mexican", "Japanese", "Egyptian", "Russian");
  $flags = array('em-cn', 'em-us', 'em-it', 'em-it', 'em-jp', 'em-it', 'em-ru');

?>

  <h1>Contact Us</h1>

  <!-- <p>Name: <?php echo $name; ?></p> -->

  <form action="contactus.php" method="post" class="text-left col-md-6 col-md-offset-3">

    <div class="form-group">

      <label for="name">Name:</label>
      <input type="text" name="name" id="name" class="form-control" value="<?php echo $name; ?>">

      <label for="email">Email:</label>
      <input type="email" name="email" id="email" class="form-control" value="<?php echo $email; ?>">

      <!-- <label for="num3">Number 3:</label>
      <input type="number" pattern="[0-9]*" name="num3" id="num3" class="form-control" value="<?php echo $num3; ?>"> -->

      <label for="question">Question:</label>
      <textarea name="question" id="question" class="form-control"><?php echo $question; ?></textarea>

      <label for="newsletter">Newsletter:</label>
      <input type="checkbox" value="subscribed" name="newsletter" id="newsletter" <?php echo $newsletterSubscribed; ?> >

      <br/>

      <label for="newsletter">Blog:</label>
      <input type="checkbox" value="subscribed" name="blog" id="blog" <?php echo $blogSubscribed; ?> >

      <br/>

      <label for="byPhone">Contact Me By Phone:</label>
      <input type="radio" value="contactPhone" name="contactBy">

      <br/>

      <label for="byPhone">Contact Me By Email:</label>
      <input type="radio" value="contactEmail" name="contactBy">

      <br/>

      <label for="restaurant">Choose a Restaurant</label>

      <?php

      CreateSelectBox("restaurant", $restaurants, $restaurant)

      ?>
    </div>

    <input type="submit" name="submit" value="Ask a Question" class="btn btn-primary">
  </form>

<?php

  include 'includes/footer.php';

?>