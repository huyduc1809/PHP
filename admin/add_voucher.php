<?php
include("../connection/connect.php");
error_reporting(0);
session_start();

if (isset($_POST['submit'])) {
    if (empty($_POST['d_name']) || empty($_POST['d_ma']) || empty($_POST['price']) || empty($_POST['res_name'])) {
        $error = '<div class="alert alert-danger alert-dismissible fade show">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>All fields must be filled up!</strong>
                </div>';
    } else {

        $sql = "INSERT INTO voucher VALUES ('" . $_POST['d_ma'] . "', '" . $_POST['d_name'] . "', '" . $_POST['price'] . "')";
        mysqli_query($db, $sql);
        if ($_POST['res_name'] == "all") {

            $sql2 = "select u_id from users";
            $kq = mysqli_query($db, $sql2);

            while ($rows = mysqli_fetch_array($kq)) {
                $sql1 = "INSERT INTO chitiet_voucher VALUES ('" . $rows['u_id'] . "','" . $_POST['d_ma'] . "', 1)";
                mysqli_query($db, $sql1);
            }
        }


        $success = '<div class="alert alert-success alert-dismissible fade show">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            New dish added successfully.
                        </div>';
        header("location: all_voucher.php");
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <title>Add Menu</title>
    <link href="css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="css/helper.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="fix-header">

    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>

    <div id="main-wrapper">

        <div class="header">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header">
                    <a class="navbar-brand" href="dashboard.php">

                        <span><img src="images/logoko.png" alt="homepage" class="dark-logo" style="width: 70px" /></span>
                    </a>
                </div>
                <div class="navbar-collapse">

                    <ul class="navbar-nav mr-auto mt-md-0">

                    </ul>

                    <ul class="navbar-nav my-lg-0">


                        <li class="nav-item dropdown">

                            <div class="dropdown-menu dropdown-menu-right mailbox animated zoomIn">
                                <ul>
                                    <li>
                                        <div class="drop-title">Notifications
                                        </div>
                                    </li>

                                    <li>
                                        <a class="nav-link text-center" href="javascript:void(0);">
                                            <strong>Check all
                                                notifications</strong> <i class="fa fa-angle-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted  " href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/bookingSystem/user-icn.png" alt="user" class="profile-pic" /></a>
                            <div class="dropdown-menu dropdown-menu-right animated zoomIn">
                                <ul class="dropdown-user">
                                    <li><a href="logout.php"><i class="fa fa-power-off"></i>
                                            Logout</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="left-sidebar">

            <div class="scroll-sidebar">

                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-devider"></li>
                        <li class="nav-label">Home</li>
                        <li> <a href="dashboard.php"><i class="fa fa-tachometer"></i><span>Dashboard</span></a>
                        </li>
                        <li class="nav-label">Hệ thống quản lý CRUD</li>
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-user f-s-20 color-warning"></i><span class="hide-menu">Tài khoản</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="all_users.php">Danh sách tài
                                        khoản</a></li>
                                <?php if ($_SESSION['role'] == 'admin') { ?> <li><a href="add_users.php">Thêm tài khoản</a>
                                    </li>
                                <?php } ?>

                            </ul>
                        </li>
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-archive f-s-20 color-warning"></i><span class="hide-menu">Quán ăn</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="all_restaurant.php">Danh sách quán
                                        ăn</a></li>
                                <?php if ($_SESSION['role'] == 'admin') { ?> <li><a href="add_category.php">Thêm danh mục</a>
                                    </li>
                                    <li><a href="add_restaurant.php">Thêm quán
                                            ăn</a></li>
                                <?php } ?>

                            </ul>
                        </li>
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-cutlery" aria-hidden="true"></i><span class="hide-menu">Món ăn</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="all_menu.php">Danh sách món ăn</a>
                                </li>
                                <?php if ($_SESSION['role'] == 'admin') { ?> <li><a href="add_menu.php">Thêm món ăn</a></li>
                                <?php } ?>

                            </ul>
                        </li>
                        <li> <a href="all_orders.php"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span>Đơn
                                    hàng</span></a></li>
                        <li> <a href="all_chinhanh.php"><i class="fa fa-home" aria-hidden="true"></i><span>Quản lý chi nhánh</span></a></li>

                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-ticket" aria-hidden="true"></i><span class="hide-menu">Quản lý voucher</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="all_voucher.php">Danh sách voucher</a>
                                </li>
                                <?php if ($_SESSION['role'] == 'admin') { ?> <li><a href="add_voucher.php">Thêm voucher</a></li> <?php } ?>
                            </ul>


                        </li>

                    </ul>
                </nav>
            </div>
        </div>
        <div class="page-wrapper">
            <div class="container-fluid">
                <!-- Start Page Content -->
                <?php echo $error;
                echo $success; ?>
                <div class="col-lg-12">
                    <div class="card card-outline-primary">
                        <div class="card-header">
                            <h4 class="m-b-0 text-white">Thêm voucher</h4>
                        </div>
                        <div class="card-body">
                            <form action='' method='post' enctype="multipart/form-data">
                                <div class="form-body">
                                    <hr>
                                    <div class="row p-t-20">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Mã voucher</label>
                                                <input type="text" name="d_ma" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Tên voucher</label>
                                                <input type="text" name="d_name" class="form-control">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row p-t-20">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Giảm giá
                                                </label>
                                                <input type="text" name="price" class="form-control" placeholder="$">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group has-danger">
                                                <label class="control-label">Áp dụng cho</label>
                                                <select name="res_name" class="form-control custom-select" data-placeholder="Choose a Category" tabindex="1">
                                                    <option value="all">Tất cả</option>
                                                    <option value="Nhom1">Nhóm 1</option>

                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                        </div>
                        <div class="form-actions">
                            <input type="submit" name="submit" class="btn btn-primary" value="Save">
                            <a href="add_voucher.php" class="btn btn-inverse">Cancel</a>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
            <footer class="footer"> © 2023 - Team Pixel </footer>
        </div>
    </div>
    </div>
    </div>

    <script src="js/lib/jquery/jquery.min.js"></script>
    <script src="js/lib/bootstrap/js/popper.min.js"></script>
    <script src="js/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery.slimscroll.js"></script>
    <script src="js/sidebarmenu.js"></script>
    <script src="js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="js/custom.min.js"></script>

</body>

</html>