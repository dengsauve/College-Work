<?php

require_once 'autoload.php';
include 'includes/functions.php';

$db = db_connect();

$faker = Faker\Factory::create();

echo $faker->address;
echo $faker->bs;

echo "<br/><br/>";

/*
for( $i=0; $i < 20; $i++){
  $name = $faker->name;
  $location = $faker->address;
  $priceRangeLow = rand(1, 10);
  $priceRangeHigh = rand(11, 75);
  $tags = $faker->bs;

  $sql = "INSERT INTO `restaurants` (`id`, `name`, `location`, `priceRangeLow`, `priceRangeHigh`, `tags`, `modifiedAt`, `createdAt`)
          VALUES (NULL, '$name', '$location', '$priceRangeLow', '$priceRangeHigh', '$tags', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";

  echo $sql;

  $result = $db->query($sql);
}
*/

for( $i; $i < 20; $i++ ){
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

  $sql = "insert into `articles` (`title`, `author`, `article_text`, `published_date`, `created_at`, `modified_at`)
          values (NULL, '$title', '$author', '$article_text', '$published_string', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";

  echo $sql . "<br/><br/>";

  $result = $db->query($sql);

}