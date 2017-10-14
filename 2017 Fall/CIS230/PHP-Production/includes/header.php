<?php
/**
 * Created by PhpStorm.
 * User: Dennis Sauve
 * Date: 9/25/2017
 * Time: 9:03 AM
 */

/* Code Goes Here */
$website = "Dennis Sauve"

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="favicon.ico">

  <title>
    <?php

    if($title != "")
    {
      echo $website . ": " . $title;
    }
    else
    {
      echo $website;
    }

    ?>
  </title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/starter-template.css" rel="stylesheet">

  <!-- Personal Style Sheet -->
  <link href="css/dennissauve.com.css" rel="stylesheet">

</head>

<body>
<header>
  <?php

    include 'includes/nav.php';

  ?>
</header>

<!-- Body Starts -->

<main class="container">

  <section class="starter-template">