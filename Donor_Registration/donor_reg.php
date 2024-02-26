<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "blood_bank_management_system";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection error". $conn->connect_error);
}
// Retrieve form data
$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$gender = $_POST['gender'];
$dob = $_POST['dob'];
$bloodType = $_POST['bloodType'];
$contactNumber = $_POST['contactNumber'];
$email = $_POST['email'];
$address = $_POST['address'];
$username = $_POST['username'];
$password = $_POST['password'];
$ld = $_POST['ld'];
$diseases = $_POST['diseases'];
$age =$_POST['age'];



// Add your database connection code here

// Example code to insert data into the recipientregistration table
$insertQuery = "INSERT INTO donorregistration (First_Name , Last_Name ,Age , Gender , Date_of_birth , Blood_Type ,Last_Donation_Time , Contact_number , Email , Address ,Disease , Username , Password )
                VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

$stmt = $conn->prepare($insertQuery);
$stmt->bind_param("ssisssissssss", $firstName, $lastName,$age, $gender, $dob, $bloodType,$ld, $contactNumber, $email, $address,$diseases, $username, $password);

if ($stmt->execute()) {
    // Registration successful
    $message = "Registration successful!";
    $class = "success-message";
} else {
    // Registration failed
    $message = "Registration failed. Please try again.";
    $class = "error-message";
}

$stmt->close();
$conn->close();
// Add your database connection closing code here
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Result</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            color: #3498db;
            text-align: center;
        }

        .success-message {
            color: #27ae60;
            margin-top: 10px;
        }

        .error-message {
            color: #e74c3c;
            margin-top: 10px;
        }

        .go-home {
            margin-top: 20px;
            text-align: center;
        }

        .go-home a {
            text-decoration: none;
            color: #333;
            padding: 8px 16px;
            border-radius: 5px;
            background-color: #3498db;
            transition: background-color 0.3s ease;
        }

        .go-home a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Registration Result</h2>
    <div class="<?php echo $class; ?>">
        <p><?php echo $message; ?></p>
        <?php if ($class === "success-message"): ?>
            <p>Your account has been successfully registered. Welcome aboard!</p>
        <?php endif; ?>
    </div>
    <!-- <div class="go-home">
        <a href="http://localhost/Blood_Bank_Management_System/Profile_Creation/login.html">Go to Login</a>
    </div> -->
</div>

</body>
</html>
