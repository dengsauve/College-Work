<?php

$title = "Calendar";
include 'includes/header.php';
include 'includes/functions.php';

$month = $_GET["month"];
if(empty( $month )){
  $month = date("n");
}

$year = $_GET["year"];
if(empty( $year )){
  $year = date("y");
}

$nextMonth = $month + 1;
$nextYear = $year;
$previousMonth = $month - 1;
$previousYear = $year;

if ( (int)$month == 12 ){
  $nextMonth = 1;
  $nextYear = $year + 1;
}

if ( (int)$month == 1 ){
  $previousMonth = 12;
  $previousYear = $year - 1;
}


?>

  <h1>Calendar</h1>
  <hr/>

<div>

  <section class="col-xs-6">
    <a class="btn btn-info btn-sm" href="/calendar.php?month=<?php echo $previousMonth; ?>&year=<?php echo $previousYear; ?>">Previous Month</a>
  </section>
  <section class="col-xs-6">
    <a class="btn btn-info btn-sm" href="/calendar.php?month=<?php echo $nextMonth; ?>&year=<?php echo $nextYear; ?>">Next Month</a>
  </section>

</div>

<div> <!-- Calendar Here -->

      <?php

      echo miniCalendar($month, $year, true);
      echo miniCalendar($month, $year, false);

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