<?php
/**
 * Created by PhpStorm.
 * User: Dennis
 * Date: 10/4/2017
 * Time: 9:04 PM
 *
 * mysql -u dengsauve -p -h mysqldev.dennissauve.com phpdevdennissauvecom
 *
 * http://mysqldev.dennissauve.com/
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


function db_connect()
{
  $db = new mysqli('mysqldev.dennissauve.com', 'dengsauve', 'HJpo11ersql', 'phpdevdennissauvecom');

  if ($db->connect_errno) {
    echo "Failed to connect to Database: (" . $db->connect_errno . ")" . $db->connect_error;
  }

  return $db;
}


function miniCalendar( $monthToDisplay, $yearToDisplay, $large=false ){

  $ret_str = ""; // String to rendered in HTML page

  $month = $monthToDisplay;
  $year = $yearToDisplay;

  $days = array(
      'Sunday' => 'S',
      'Monday' => 'M',
      'Tuesday' => 'T',
      'Wednesday' => 'W',
      'Thursday' => 'T',
      'Friday' => 'F',
      'Saturday' => 'S'
  );

  $firstOfTheMonth = mktime(0,0,0, $month, 1, $year);
  $firstDay = date("w", $firstOfTheMonth); // w is numeric of day of the week
  $lastDay = date("t", $firstOfTheMonth); // t is numeric of number of days in month

// Please see documentation at: http://php.net/manual/en/function.date.php

  $calendar_title = date("F Y", mktime(0,0,0,$month, 1, $year));

// starting the table

  if( $large ){
    $ret_str .= "<table class=\"calendar-lg table table-responsive table-bordered \">";
  }else{
    $ret_str .= "<div class='calendar-mini'><table class=\"calendar-lg table table-responsive table-bordered table-condensed \">";
  }

  $ret_str .= "<caption class=\"text-center\"><strong>$calendar_title</strong></caption>";

  // Printing the Names of the days of the week.

  $ret_str .= "<thead><tr>";

  foreach ($days as $day => $d) {
    if($large) {
      $ret_str .= "<th class=\"text-center\"><span class='hidden-xs hidden-sm'>$day</span><span class='hidden-md hidden-lg'>$d</span></th>\n";
    }else{
      $ret_str .= "<th class=\"text-center\">$d</th>\n";
    }
  }

  $ret_str .= "</tr></thead><tr>";

  // loop and print blank cells

  $cpFirstDay = $firstDay;
  while( $cpFirstDay > 0 ){
    $ret_str .= "<td>&nbsp;</td>";
    $cpFirstDay -= 1;
  }

  $count = 8 - $firstDay;
  $day = 1;

  // loop and print the rest of the days in the first week

  while ( $day < $count ){
    $ret_str .= "<td class='text-left'>$day</td>";
    $day += 1;
  }

  $ret_str .= "</tr>";

  // looping and printing all the 'filler weeks'

  while($day <= ((int)($lastDay / 7) * 7)){

    $currentDay = mktime(0,0,0, $month, $day, $year);

    if( date("w", $currentDay) == 0 ){
      $ret_str .= "\n\t<tr><!-- Filler Week -->\n\n";
    }

    if( $day == date("j") && $month == date("n")){
      $ret_str .= "\t\t<td class='text-left'><strong>" . $day . "</strong></td>\n";
    }else {
      $ret_str .= "\t\t<td class='text-left'>" . $day . "</td>\n";
    }

    $day += 1;

    if( date("w", $currentDay) == 6  ){
      $ret_str .= "\n\t</tr>\n";
    }

  }

  // looping and printing the last week TODO: See Feb and March of 2018, issues with weeks

  while( $day <= $lastDay ){

    $currentDay = mktime(0,0,0, $month, $day, $year);

    if( date("w", $currentDay) == 0 ){
      $ret_str .= "\n\t<tr><!-- Final Week -->\n\n";
    }

    $ret_str .= "\t\t<td class='text-left'>" . $day . "</td>\n";

    $day += 1;

    // handling any 'blank days' left on calendar

    if( $day > $lastDay){

      $currentDay = mktime(0,0,0, $month, $day, $year);

      $finalCell = date("w", $currentDay);
      while( $finalCell < 6){

        $ret_str .= "\t\t<td class='text-left'>&nbsp;</td>\n";

        $day += 1;
        $currentDay = mktime(0,0,0, $month, $day, $year);
        $finalCell = date("w", $currentDay);

      }

      $ret_str .= "\t\t<td class='text-left'>&nbsp;</td>\n";

      $ret_str .= "\n\t</tr>\n";
    }
  }

  //closing the table

  if( $large ){
    $ret_str .= "</table>";
  }else{
    $ret_str .= "</table></div>";
  }

  return $ret_str;


}



?>