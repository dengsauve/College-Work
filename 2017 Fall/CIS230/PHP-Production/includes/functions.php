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

/** **************************************************
 *
 * miniCalendar(month, year, large?)
 *
 * Creates a calendar based on a month and year
 * The Calendar is large or small based on the large bool
 *
 * Returns a string of HTML for Calendar
 *
 * @param $monthToDisplay
 * @param $yearToDisplay
 * @param $large
 *
 * @return string
 *
 * **************************************************/

function miniCalendar( $monthToDisplay, $yearToDisplay, $large=false )
{

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

  $firstOfTheMonth = mktime(0, 0, 0, $month, 1, $year);
  $firstDay = date("w", $firstOfTheMonth); // w is numeric of day of the week

  $lastDay = date("t", $firstOfTheMonth); // t is numeric of number of days in month
  $lastOfTheMonth = mktime(0, 0, 0, $month, $lastDay, $year);
  $lastWeekDay = date("w", $lastOfTheMonth);

  $calendar_title = date("F Y", mktime(0, 0, 0, $month, 1, $year));

  // starting the table
  if ($large) {
    $ret_str .= "<table class=\"calendar-lg table table-responsive table-bordered \">";
  } else {
    $ret_str .= "<div class='calendar-mini'><table class=\"calendar-lg table table-responsive table-bordered table-condensed \">";
  }

  // Adding the title to the calendar
  $ret_str .= "<caption class=\"text-center\"><strong>$calendar_title</strong></caption>";

  // Opening the Table Head
  $ret_str .= "<thead><tr>";

  // Printing the Names of the days of the week.
  foreach ($days as $day => $d) {
    if ($large) {
      $ret_str .= "<th class=\"text-center\"><span class='hidden-xs hidden-sm'>$day</span><span class='hidden-md hidden-lg'>$d</span></th>\n";
    } else {
      $ret_str .= "<th class=\"text-center\">$d</th>\n";
    }
  }

  // Close Table Head
  $ret_str .= "</tr></thead>";

  // Open Row for First Week
  $ret_str .= "<tr>";

  // loop and print blank cells
  $cpFirstDay = $firstDay;
  while ($cpFirstDay > 0) {
    $ret_str .= "<td>&nbsp;</td>";
    $cpFirstDay -= 1;
  }

  $day = 1;

  // loop and print the rest of the days in the first week
  while ($day < (8 - $firstDay)) {
    $ret_str .= "<td class='text-left'>$day</td>";
    $day += 1;
  }

  // Close the first week
  $ret_str .= "</tr>";

  // looping and printing all the 'filler weeks'
  while ($day <= ((int)($lastDay / 7) * 7)) {

    $currentDay = mktime(0, 0, 0, $month, $day, $year);

    // Check if Current Day is the start of a new week (row)
    if (date("w", $currentDay) == 0) {
      $ret_str .= "\n\t<tr><!-- Filler Week -->\n\n";
    }

    // Check if day is current month/day (over years so you can easily see day on next year)
    if ($day == date("j") && $month == date("n")) {
      $ret_str .= "\t\t<td class='text-left'><strong>" . $day . "</strong></td>\n";
    } else {
      $ret_str .= "\t\t<td class='text-left'>" . $day . "</td>\n";
    }

    // Check if currentDay is the end of a week (row)
    if (date("w", $currentDay) == 6) {
      $ret_str .= "\n\t</tr>\n";
    }

    $day += 1;

  }

  // Dummy variable to check for 28 day months
  $mLastDay = $lastDay;

  // looping and printing the last week FIXED_TODO: See Feb and March of 2018, issues with weeks
  while ($day <= $lastDay or ($mLastDay % 7) == 0) {
    $mLastDay = 1;

    $currentDay = mktime(0, 0, 0, $month, $day, $year);

    if (date("w", $currentDay) == 0) {
      $ret_str .= "\n\t<tr><!-- Final Week -->\n\n";
    }

    if ($day <= $lastDay) {
      $ret_str .= "\t\t<td class='text-left'>" . $day . "</td>\n";
    }

    $day += 1;

    // handling any 'blank days' left on calendar
    if ($day > $lastDay and $lastWeekDay != 6) {

      $currentDay = mktime(0, 0, 0, $month, $day, $year);

      $finalCell = date("w", $currentDay);
      while ($finalCell < 6 or ($month == 2 and $finalCell < 6)) {

        $ret_str .= "\t\t<td class='text-left'>&nbsp;</td>\n";

        $finalCell += 1; //date("w", $currentDay);

      }

      if ($month == 2 and date("L", $firstOfTheMonth) == 0) {
        $ret_str .= "\t\t<td class='text-left'>&nbsp;</td>\n";
      }

      $ret_str .= "\t\t<td class='text-left'>&nbsp;</td>\n";

      $ret_str .= "\n\t</tr>\n";
    }
  }

  //closing the table

  if ($large) {
    $ret_str .= "</table>";
  } else {
    $ret_str .= "</table></div>";
  }

  return $ret_str;
}

/** **************************************************
 *
 * time_elapsed_string($datetime, $full = false)
 * by: bafromca on StackOverflow
 * see: https://stackoverflow.com/a/32723846
 *
 * Creates reader friendly elapsed time from timestamp
 *
 * Returns a string of elapsed time.
 *
 * @param $datetime
 * @param $full
 *
 * @return string
 *
 * **************************************************/

function time_elapsed_string($datetime, $full = false) {
  $now = new DateTime;
  $then = new DateTime( $datetime );
  $diff = (array) $now->diff( $then );

  $diff['w']  = floor( $diff['d'] / 7 );
  $diff['d'] -= $diff['w'] * 7;

  $string = array(
      'y' => 'year',
      'm' => 'month',
      'w' => 'week',
      'd' => 'day',
      'h' => 'hour',
      'i' => 'minute',
      's' => 'second',
  );

  foreach( $string as $k => & $v )
  {
    if ( $diff[$k] )
    {
      $v = $diff[$k] . ' ' . $v .( $diff[$k] > 1 ? 's' : '' );
    }
    else
    {
      unset( $string[$k] );
    }
  }

  if ( ! $full ) $string = array_slice( $string, 0, 1 );
  return $string ? implode( ', ', $string ) . ' ago' : 'just now';
}


?>