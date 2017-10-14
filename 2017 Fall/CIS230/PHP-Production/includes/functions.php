<?php
/**
 * Created by PhpStorm.
 * User: Dennis
 * Date: 10/4/2017
 * Time: 9:04 PM
 */

/**
 * @param $selectBoxName
 * @param $optionsArray
 * @param $selectedOption
 */

function CreateSelectBox($selectBoxName, $optionsArray, $selectedOption)
{
  echo "<select name=\"$selectBoxName\" class=\"form-control\" id=\"$selectBoxName\">";
  $count = 0;
  while ($count < count($optionsArray)) {

    if ($selectedOption == $optionsArray[$count]) {
      echo '<option selected="selected">';
    } else {
      echo "<option>";
    }

    echo "$optionsArray[$count]";
    echo "</option>";
    $count = $count + 1;
  }
  echo '</select>';
}

?>