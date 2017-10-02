<?php

  $title = "Contact Us";
  include 'templates/header.php';
  $num1 = $_GET['num1'];
  $num2 = $_GET['num2'];
  $num3 = $_GET['num3'];
  $sum = $num1 + $num2 + $num3;

  echo "Num1: $num1   Num2: $num2   Nun3: $num3 <br/>";
  echo "The sum of num1 and num2 is $sum";

?>

  <h1>Contact Us</h1>

  <p>This is a contact form.</p>

  <form action="contactus.php" method="get" class="text-left">
    <div class="form-group">
      <label for="num1">Number 1:</label>
      <input type="number" name="num1" id="num1" class="form-control">
      <label for="num2">Number 2:</label>
      <input type="number" name="num2" id="num2" class="form-control">
      <label for="num3">Number 3:</label>
      <input type="number" name="num3" id="num3" class="form-control">
    </div>
    <input type="submit" name="submit" value="Calculate Sum" class="btn btn-primary">
  </form>

<?php

  include 'templates/footer.php';

?>