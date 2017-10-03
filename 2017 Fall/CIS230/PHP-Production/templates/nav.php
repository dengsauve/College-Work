<?php
/**
 * Created by PhpStorm.
 * User: Dennis
 * Date: 9/25/2017
 * Time: 9:32 AM
 */
?>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
              aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/index.php">DS</a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li <?php echo ($title == "Home" ? "class=\"active\"" : ""); ?>><a href="/index.php">Home</a></li> <!-- class="active" -->
        <li <?php echo ($title == "Contact Us" ? "class=\"active\"" : ""); ?>><a href="/contactus.php">Contact Us</a></li>
        <li <?php echo ($title == "Products" ? "class=\"active\"" : ""); ?>><a href="/products.php">Products</a></li>
        <li <?php echo ($title == "Blog" ? "class=\"active\"" : ""); ?>><a href="/blog.php">Blog</a></li>
        <li <?php echo ($title == "Calendar" ? "class=\"active\"" : ""); ?>><a href="/calendar.php">Calendar</a></li>
        <li <?php echo ($title == "Maps" ? "class=\"active\"" : ""); ?>><a href="/maps.php">Maps</a></li>
        <li <?php echo ($title == "Preferences" ? "class=\"active\"" : ""); ?>><a href="/preferences.php">Preferences</a></li>
        <li <?php echo ($title == "Login" ? "class=\"active\"" : ""); ?>><a href="/login.php">Login</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>
