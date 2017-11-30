<?php
/**
 * Created by PhpStorm.
 * User: Dennis
 * Date: 11/29/2017
 * Time: 7:04 PM
 */

ob_start();
session_start();

session_destroy();

ob_clean();
header("Location: /");

?>