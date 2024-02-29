<?php
include("../connection/connect.php");
error_reporting(0);
session_start();

mysqli_query($db, "DELETE FROM voucher WHERE id_voucher = '" . $_GET['voucher_del'] . "'");
header("location:all_voucher.php");
