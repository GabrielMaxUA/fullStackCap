<?php

define('DB_HOST', 'localhost');
define('DB_USER', 'maximUA');
define('DB_PASS', 'MaxGabriel123');
define('DB_NAME', 'frame_me');

function connect(){
    $connect = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);

    if (mysqli_connect_errno()) {
        die("Failed to connect: " . mysqli_connect_error());
    }
    mysqli_set_charset($connect, 'utf8');
    return $connect; 
}
$con = connect();
?> 

