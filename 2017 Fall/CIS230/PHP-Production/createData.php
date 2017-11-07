<?php

require_once 'autoload.php';
include 'includes/functions.php';

$db = db_connect();

$faker = Faker\Factory::create();

echo $faker->address;
echo $faker->bs;

echo "<br/><br/>";


// Delete all restaurants and reviews
$result = $db->query("delete from restaurants");
$result = $db->query("delete from reviews");

// Populate restaurants and reviews table
for( $i=0; $i < 200; $i++){
  // restaurant values
  $name = $faker->name;
  $location = $faker->address;
  $priceRangeLow = rand(1, 10);
  $priceRangeHigh = rand(11, 75);
  $tags = $faker->bs;

  $sql = "INSERT INTO `restaurants` (`id`, `name`, `location`, `priceRangeLow`, `priceRangeHigh`, `tags`, `modifiedAt`, `createdAt`)
          VALUES (NULL, '$name', '$location', '$priceRangeLow', '$priceRangeHigh', '$tags', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";

  echo $sql;

  $result = $db->query($sql);

  // $restaurantIDFK declared outside loop, as we only need the id of last restaurant created
  $restaurantIDFK = $db->insert_id;

  $numReviews = rand(1,10);
  for( $j=0; $j < $numReviews; $j++){
    $author = $faker->name;
    $reviewText = $faker->bs;
    $rating = rand(1,5);

    $sql = "insert into reviews (id, author, review, rating, created_at, restaurantIDFK)
                    values (null, '$author', '$reviewText', $rating, CURRENT_TIMESTAMP, $restaurantIDFK)";

    $result = $db->query($sql);
  }
}


/*
for( $i=0; $i < 20; $i++ ){
  $title = $faker->company;
  $author = $faker->name;
  $article_text = $faker->text(1000);
  $published_date = $faker->dateTimeThisYear($max = 'now');
  $published_string = $published_date->format("Y-m-d H:i:s");
  echo $title . "<br/>";
  echo $author . "<br/>";
  echo $article_text . "<br/>";
  echo $published_string . "<br/>";
  echo "<br/>";

  $sql = "INSERT INTO articles (`article_id`, `title`, `author`, `article_text`, `published_date`, `created_at`, `modified_at`)
          VALUES (NULL, '$title', '$author', '$article_text', '$published_string', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";

  echo $sql . "<br/><br/>";

  $result = $db->query($sql);

}

*/






$db->close();