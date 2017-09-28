<?php

include 'templates/header.php';

?>

<h1>Sandbox</h1>

<?php
  $count = 1;
  while ($count < 6){
    echo "<p>";
    echo $count;
    echo "</p>";
    echo "\n";
    $count ++;
  }

  print "This was printed using the print command without ()";

?>

<?php

include 'templates/footer.php';

?>
