<?php

$title = "Calendar";
include 'includes/header.php';

$calendar_title = date("F Y");
$days = array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');


// Please see documentation at: http://php.net/manual/en/function.date.php
?>

  <h1>Calendar</h1>

<div> <!-- Calendar Here -->

  <table class="col-xs-12 calendar-lg table-responsive table-bordered">
    <caption class="text-center"><?php echo $calendar_title ?></caption>
    <tr>
      <?php

      foreach ($days as $day) {
          echo "<th class=\"text-center\">$day</th>\n";
        }

      ?>
    </tr>
  </table>

</div>
  <hr/>

  <a href="https://www.scc.spokane.edu/Resources/AcademicCalendar.aspx" title="SCC Academic Calendar" target="_blank">
    <img src="images/scc_calendar.PNG" alt="Spokane Community College Calendar" class="img-fluid calendar" />
  </a>

<?php

include 'includes/footer.php';

?>