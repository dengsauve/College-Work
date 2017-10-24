<?php

$title = "default-page";
include 'includes/header.php';
include 'includes/functions.php';

$id = $_GET['id'];

$db = db_connect();

$sql = "select * from restaurants where id=$id";

$result = $db->query($sql);

mysqli_close( $db );

?>

<h1>Restaurant</h1>

<p>This is a page that shows one restaurants details.</p>

<?php

include 'includes/footer.php';

?>
