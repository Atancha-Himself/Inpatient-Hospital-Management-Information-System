<?php
session_start();
include('assets/inc/config.php');
include('assets/inc/checklogin.php');
check_login();
$aid = $_SESSION['ad_id'];
?>

<!DOCTYPE html>
<html lang="en">

<?php include('assets/inc/head.php');?>

<body>
    <!-- Begin page -->
    <div id="wrapper">
        <!-- Topbar Start -->
        <?php include('assets/inc/nav.php');?>
        <!-- end Topbar -->

        <!-- ========== Left Sidebar Start ========== -->
        <?php include("assets/inc/sidebar.php");?>
        <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->

        <div class="content-page">
            <div class="content">
                <!-- Start Content-->
                <div class="container-fluid">
                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="his_admin_view_beds.php">Beds</a></li>
                                        <li class="breadcrumb-item active">View Ward Beds</li>
                                    </ol>
                                </div>
                                <?php
                                $ward_id = $_GET['ward_id'];
                                $ret = "SELECT ward_name FROM his_wards WHERE ward_id = ?";
                                $stmt = $mysqli->prepare($ret);
                                $stmt->bind_param('i', $ward_id);
                                $stmt->execute();
                                $res = $stmt->get_result();
                                $ward = $res->fetch_object();
                                ?>
                                <h4 class="page-title">Bed Information for <?php echo $ward->ward_name;?></h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card-box">
                                <h4 class="header-title">Beds in <?php echo $ward->ward_name;?></h4>
                                <div class="table-responsive">
                                    <table class="table table-bordered toggle-circle mb-0" data-page-size="7">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Bed ID</th>
                                                <th>Patient Name</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $ret = "SELECT b.bed_id, b.status, p.pat_fname, p.pat_lname 
                                                    FROM his_beds b 
                                                    LEFT JOIN his_patients p ON b.pat_id = p.pat_id 
                                                    WHERE b.ward_id = ? 
                                                    ORDER BY b.bed_id";
                                            $stmt = $mysqli->prepare($ret);
                                            $stmt->bind_param('i', $ward_id);
                                            $stmt->execute();
                                            $res = $stmt->get_result();
                                            $cnt = 1;
                                            while ($row = $res->fetch_object()) {
                                            ?>
                                                <tr>
                                                    <td><?php echo $cnt;?></td>
                                                    <td><?php echo $row->bed_id;?></td>
                                                    <td><?php echo ($row->pat_fname && $row->pat_lname) ? $row->pat_fname . " " . $row->pat_lname : 'Not Occupied';?></td>
                                                    <td><?php echo $row->status;?></td>
                                                </tr>
                                            <?php
                                                $cnt++;
                                            }
                                            ?>
                                        </tbody>
                                        <tfoot>
                                            <tr class="active">
                                                <td colspan="4">
                                                    <div class="text-right">
                                                        <ul class="pagination pagination-rounded justify-content-end footable-pagination m-t-10 mb-0"></ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div> <!-- end .table-responsive -->
                            </div> <!-- end card-box -->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->
                </div> <!-- container -->
            </div> <!-- content -->

            <!-- Footer Start -->
            <?php include('assets/inc/footer.php');?>
            <!-- end Footer -->
        </div>

        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->
    </div>
    <!-- END wrapper -->

    <!-- Right bar overlay -->
    <div class="rightbar-overlay"></div>

    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>

    <!-- Footable js -->
    <script src="assets/libs/footable/footable.all.min.js"></script>

    <!-- Init js -->
    <script src="assets/js/pages/foo-tables.init.js"></script>

    <!-- App js -->
    <script src="assets/js/app.min.js"></script>
</body>
</html>