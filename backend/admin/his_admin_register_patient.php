<!--Server side code to handle Patient Registration-->
<?php
session_start();
include('assets/inc/config.php');

if (isset($_POST['add_patient'])) {
    $pat_fname = $_POST['pat_fname'];
    $pat_lname = $_POST['pat_lname'];
    $pat_number = $_POST['pat_number'];
    $pat_phone = $_POST['pat_phone'];
    $pat_addr = $_POST['pat_addr'];
    $pat_age = $_POST['pat_age'];
    $pat_dob = $_POST['pat_dob'];
    $pat_ailment = $_POST['pat_ailment'];

    // Step 1: Check for available beds based on ailment
    $is_pregnancy = (strtolower($pat_ailment) === 'pregnancy');
    if ($is_pregnancy) {
        $bed_query = "SELECT bed_id FROM his_beds WHERE ward_id = 4 AND status = 'unoccupied' LIMIT 1";
    } else {
        $bed_query = "SELECT bed_id FROM his_beds WHERE ward_id IN (1, 2, 3) AND status = 'unoccupied' ORDER BY RAND() LIMIT 1";
    }

    $stmt = $mysqli->prepare($bed_query);
    $stmt->execute();
    $result = $stmt->get_result();
    $bed = $result->fetch_assoc();

    if (!$bed) {
        $err = "Hospital is filled to capacity. No beds available.";
    } else {
        // Step 2: Register the patient
        $query = "INSERT INTO his_patients (pat_fname, pat_ailment, pat_lname, pat_age, pat_dob, pat_number, pat_phone, pat_addr) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $mysqli->prepare($query);
        $stmt->bind_param('ssssssss', $pat_fname, $pat_ailment, $pat_lname, $pat_age, $pat_dob, $pat_number, $pat_phone, $pat_addr);
        $stmt->execute();

        if ($stmt) {
            $pat_id = $mysqli->insert_id;

            // Step 3: Assign the bed and update its status
            $bed_id = $bed['bed_id'];
            $update_query = "UPDATE his_beds SET pat_id = ?, status = 'occupied' WHERE bed_id = ?";
            $stmt = $mysqli->prepare($update_query);
            $stmt->bind_param('ii', $pat_id, $bed_id);
            $stmt->execute();

            if ($stmt) {
                $success = "Patient Details Added and Bed Assigned";
            } else {
                $err = "Failed to assign bed. Please try again.";
            }
        } else {
            $err = "Failed to register patient. Please try again.";
        }
    }
}
?>
<!--End Server Side-->
<!DOCTYPE html>
<html lang="en">
<?php include('assets/inc/head.php');?>
<body>
    <div id="wrapper">
        <?php include("assets/inc/nav.php");?>
        <?php include("assets/inc/sidebar.php");?>
        <div class="content-page">
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="his_admin_dashboard.php">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Patients</a></li>
                                        <li class="breadcrumb-item active">Add Patient</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Add Patient Details</h4>
                            </div>
                        </div>
                    </div>     
                    <div class="row">
                        <div class="col-12">
                            <!-- Display Success Message -->
                            <?php if (isset($success)) { ?>
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <?php echo $success; ?>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            <?php } ?>
                            <!-- Display Error Message -->
                            <?php if (isset($err)) { ?>
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <?php echo $err; ?>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            <?php } ?>
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Fill all fields</h4>
                                    <form method="post">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4" class="col-form-label">First Name</label>
                                                <input type="text" required="required" name="pat_fname" class="form-control" id="inputEmail4" placeholder="Patient's First Name">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputPassword4" class="col-form-label">Last Name</label>
                                                <input required="required" type="text" name="pat_lname" class="form-control" id="inputPassword4" placeholder="Patient`s Last Name">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4" class="col-form-label">Date Of Birth</label>
                                                <input type="text" required="required" name="pat_dob" class="form-control" id="inputEmail4" placeholder="DD/MM/YYYY">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputPassword4" class="col-form-label">Age</label>
                                                <input required="required" type="text" name="pat_age" class="form-control" id="inputPassword4" placeholder="Patient`s Age">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputAddress" class="col-form-label">Address</label>
                                            <input required="required" type="text" class="form-control" name="pat_addr" id="inputAddress" placeholder="Patient's Addresss">
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                                <label for="inputCity" class="col-form-label">Mobile Number</label>
                                                <input required="required" type="text" name="pat_phone" class="form-control" id="inputCity">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="inputCity" class="col-form-label">Patient Ailment</label>
                                                <input required="required" type="text" name="pat_ailment" class="form-control" id="inputCity">
                                            </div>
                                            
                                            <div class="form-group col-md-2" style="display:none">
                                                <?php 
                                                    $length = 5;    
                                                    $patient_number = substr(str_shuffle('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 1, $length);
                                                ?>
                                                <label for="inputZip" class="col-form-label">Patient Number</label>
                                                <input type="text" name="pat_number" value="<?php echo $patient_number; ?>" class="form-control" id="inputZip">
                                            </div>
                                        </div>
                                        <button type="submit" name="add_patient" class="ladda-button btn btn-primary" data-style="expand-right">Add Patient</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php include('assets/inc/footer.php');?>
        </div>
    </div>
    <div class="rightbar-overlay"></div>
    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>
    <script src="assets/libs/ladda/spin.js"></script>
    <script src="assets/libs/ladda/ladda.js"></script>
    <script src="assets/js/pages/loading-btn.init.js"></script>
</body>
</html>