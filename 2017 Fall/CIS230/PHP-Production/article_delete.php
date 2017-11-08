<?php

ob_start();

include 'includes/functions.php';

// Incoming id of article to delete
$id = $_GET['id'];

// db connect, sql delete, and run
$db = db_connect();
$sql = "delete from articles where article_id=$id";
$result = $db->query($sql);

// redirect to All Articles
ob_clean();
header("Location: /articles_all.php?id=$id");
exit;
?>