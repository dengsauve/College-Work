<?php

$title = "Calendar";
include 'includes/header.php';

$days = array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

$month = $_GET["month"];
if(empty( $month )){
  $month = date("n");
}

$year = $_GET["year"];
if(empty( $year )){
  $year = date("y");
}

$firstOfTheMonth = mktime(0,0,0, $month, 1, $year);
$firstDay = date("w", $firstOfTheMonth); // w is numeric of day of the week
$lastDay = date("t"); // t is numeric of number of days in month

$calendar_title = date("F Y", mktime(0,0,0,$month, 1, $year));

// Please see documentation at: http://php.net/manual/en/function.date.php
?>

  <h1>Calendar</h1>
  <hr/>
<div> <!-- Calendar Here -->

      <?php

      // starting the table

      echo "<table class=\"calendar-lg table table-responsive table-bordered\">";
      echo "<caption class=\"text-center\"><strong>$calendar_title</strong></caption>";

      // Printing the Names of the days of the week.

      echo "<thead><tr>";

      foreach ($days as $day) {
          echo "<th class=\"text-center\">$day</th>\n";
        }

      echo "</tr></thead><tr>";

      // loop and print blank cells

      $cpFirstDay = $firstDay;
      while( $cpFirstDay > 0 ){
        echo "<td>&nbsp;</td>";
        $cpFirstDay -= 1;
      }

      $count = 8 - $firstDay;
      $day = 1;

      // loop and print the rest of the days in the first week

      while ( $day < $count ){
        echo "<td class='text-left'>$day</td>";
        $day += 1;
      }

      echo "</tr>";

      // looping and printing all the 'filler weeks'

      while($day <= ((int)($lastDay / 7) * 7)){

        $currentDay = mktime(0,0,0, $month, $day, $year);

        if( date("w", $currentDay) == 0 ){
          echo "\n\t<tr><!-- Filler Week -->\n\n";
        }

        echo "\t\t<td class='text-left'>" . $day . "</td>\n";

        $day += 1;

        if( date("w", $currentDay) == 6  ){
          echo "\n\t</tr>\n";
        }

      }

      // looping and printing the last week

      while( $day <= $lastDay ){

        $currentDay = mktime(0,0,0, $month, $day, $year);

        if( date("w", $currentDay) == 0 ){
          echo "\n\t<tr><!-- Final Week -->\n\n";
        }

        echo "\t\t<td class='text-left'>" . $day . "</td>\n";

        $day += 1;

        // handling any 'blank days' left on calendar

        if( $day > $lastDay){

          $currentDay = mktime(0,0,0, $month, $day, $year);

          $finalCell = date("w", $currentDay);
          while( $finalCell < 6){

            echo "\t\t<td class='text-left'>&nbsp;</td>\n";

            $day += 1;
            $currentDay = mktime(0,0,0, $month, $day, $year);
            $finalCell = date("w", $currentDay);

          }

          echo "\t\t<td class='text-left'>&nbsp;</td>\n";

          echo "\n\t</tr>\n";
        }
      }

      //closing the table

      echo "</table>";

      ?>

</div>

<!--
  <a href="https://www.scc.spokane.edu/Resources/AcademicCalendar.aspx" title="SCC Academic Calendar" target="_blank">
    <img src="images/scc_calendar.PNG" alt="Spokane Community College Calendar" class="img-fluid calendar" />
  </a>
-->
<?php

include 'includes/footer.php';

?>