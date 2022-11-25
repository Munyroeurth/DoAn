<?php
$_servername = "localhost";
$username = "root";
$password = "";
$dbname = "TestDB";
$table = "Employees"; // Let create a table named Employee
//We will get actions from the app to do operation in the database
$action = $_POST["action"];

// create the connecttion
$conn = new mysqli($_servername, $username, $password, $dbname);

//check connection 

if($conn->connection_error){
    die("Connection Failed: " . $conn->connection_error);
    return;
}
//if connection is ok .....

// if the app send an action to create the table .....
if("CREATE_TABLE" == $action){
    $sql = "CREATE TABLE IS NOT EXISTS $table (
        id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(30) NOT NULL,
        last_name VARCHAR(30) NOT NULL,
        )"
    if($conn->query($sql) === TRUE){
        // Send back succes message 
        echo "succes";
    }else{
        echo "error";
    }
    $conn->close();
    return;
}
//Get all employee record from the database
if("GET_ALL" == $action){
    $db_data = array();
    $sql = "SELECT id, first_name, last_name from $table ORDER BY id DESC";
    $result = $conn->query($sql);
    if($result-> num_row > 0){
        while($row = $result-> fetch_assoc()){
            $db_data[] = $row;
        }
        // Send back the complete record as a json
        echo json_encode($db_data);
    }
    else{
        echo "error";  
    }
    $conn->close();
    return;
}
// ADD An Employyee
if("ADD_EMP" == $action){
    // App will be posting these value to this server
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $sql = "INSERT INTO $table (first_name, last_name) VALUES('first_name', 'last_name')";
    $result = $conn->query($sql);
    echo "success";
    $conn->close();
    return;
}
//Update an employye 
if("UPDATE_EMP" == $action){
    // App will be posting these value to this server
    $emp_id = $_POST['$emp_id'];
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $sql = "UPDATE $table SET first_name = '$first_name', 'last_name' = '$last_name' WHERE id = '$emp_id' ";
    if($conn->query($sql) === TRUE){
        echo "success";
    }else{
        echo "error";
    }
    $conn->close();
    return;
}
//Delete an Employee
if('DELETE_EMP' == $action){
    $emp_id = $_POST['$emp_id'];
    $sql = "DELETE FROM $table WHERE id = $emp_id"; // Dont need quote since id is an intenger
    if($conn->query($sql) === TRUE){
        echo "success";
    }else{
        echo "error";
    }
    $conn->close();
    return;

}

?>