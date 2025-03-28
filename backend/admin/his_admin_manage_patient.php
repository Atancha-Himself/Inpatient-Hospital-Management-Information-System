<?php
session_start();
include('assets/inc/config.php');
include('assets/inc/checklogin.php');
check_login();
$aid = $_SESSION['ad_id'];

if (isset($_GET['delete'])) {
    $id = intval($_GET['delete']);

    // Step 1: Free up the bed in his_beds BEFORE deleting the patient
    $bed_update = "UPDATE his_beds SET pat_id = NULL, status = 'unoccupied' WHERE pat_id = ?";
    $stmt = $mysqli->prepare($bed_update);
    $stmt->bind_param('i', $id);
    
    if ($stmt->execute()) {
        $stmt->close(); // Close statement before reusing $stmt

        // Step 2: Delete the patient from his_patients
        $adn = "DELETE FROM his_patients WHERE pat_id=?";
        $stmt = $mysqli->prepare($adn);
        $stmt->bind_param('i', $id);

        if ($stmt->execute()) {
            $_SESSION['success'] = "Patient Records Deleted and Bed Freed";
        } else {
            $_SESSION['error'] = "Failed to delete patient. Possible foreign key constraint.";
        }
    } else {
        $_SESSION['error'] = "Failed to update bed status.";
    }

    $stmt->close();
    header("Location: his_admin_manage_patient.php"); // Redirect to refresh the page
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<?php include('assets/inc/head.php');?>

<body>
    <div id="wrapper">
        <?php include('assets/inc/nav.php');?>
        <?php include("assets/inc/sidebar.php");?>

        <div class="content-page">
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="#">Patients</a></li>
                                        <li class="breadcrumb-item active">Manage Patients</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Manage Patient Details</h4>
                            </div>
                        </div>
                    </div>     

                    <div class="row">
                        <div class="col-12">
                            <?php if (isset($_SESSION['success'])) { ?>
                                <div class="alert alert-success">
                                    <?php echo $_SESSION['success']; unset($_SESSION['success']); ?>
                                </div>
                            <?php } ?>
                            <?php if (isset($_SESSION['error'])) { ?>
                                <div class="alert alert-danger">
                                    <?php echo $_SESSION['error']; unset($_SESSION['error']); ?>
                                </div>
                            <?php } ?>

                            <div class="card-box">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Patient</th>
                                            <th>Number</th>
                                            <th>Address</th>
                                            <th>Bed ID</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php
                                        $ret = "SELECT p.*, b.bed_id 
                                                FROM his_patients p 
                                                LEFT JOIN his_beds b ON p.pat_id = b.pat_id 
                                                ORDER BY RAND()";
                                        $stmt = $mysqli->prepare($ret);
                                        $stmt->execute();
                                        $res = $stmt->get_result();
                                        $cnt = 1;
                                        while ($row = $res->fetch_object()) {
                                        ?>
                                            <tr>
                                                <td><?php echo $cnt;?></td>
                                                <td><?php echo $row->pat_fname . " " . $row->pat_lname;?></td>
                                                <td><?php echo $row->pat_number;?></td>
                                                <td><?php echo $row->pat_addr;?></td>
                                                <td><?php echo $row->bed_id ? $row->bed_id : 'Not Assigned';?></td>
                                                <td>
                                                    <a href="his_admin_manage_patient.php?delete=<?php echo $row->pat_id;?>" 
                                                       onclick="return confirm('Are you sure you want to delete this patient?');" 
                                                       class="badge badge-danger">
                                                       <i class="mdi mdi-trash-can-outline"></i> Discharge
                                                    </a>
                                                    <a href="his_admin_view_single_patient.php?pat_id=<?php echo $row->pat_id;?>" 
                                                       class="badge badge-success">
                                                       <i class="mdi mdi-eye"></i> View
                                                    </a>
                                                    <a href="his_admin_update_single_patient.php?pat_id=<?php echo $row->pat_id;?>" 
                                                       class="badge badge-primary">
                                                       <i class="mdi mdi-check-box-outline"></i> Update
                                                    </a>
                                                </td>
                                            </tr>
                                        <?php $cnt++; } ?>
                                        </tbody>
                                    </table>
                                </div> 
                            </div> 
                        </div> 
                    </div>
                </div> 
            </div> 

            <?php include('assets/inc/footer.php');?>
        </div>
    </div>

    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>
</body>
</html>
