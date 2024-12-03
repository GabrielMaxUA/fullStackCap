<?php
session_start();

require 'connection.php';
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

// Get the POST data
$postdata = file_get_contents("php://input", true);
if (isset($postdata) && !empty($postdata)) {
    $request = json_decode($postdata);

    $email = mysqli_real_escape_string($con, trim($request->email));
    $password = trim($request->password);

    // Validate input
    if (empty($email) || empty($password)) {
        http_response_code(400);
        echo json_encode(['error' => [
            'email' => empty($email) ? 'Email is required' : '',
            'password' => empty($password) ? 'Password is required' : '',
        ]]);
        exit;
    }

    // Check if the user exists
    $sql = "SELECT * FROM `customers` WHERE `email` = '$email'";
    $result = mysqli_query($con, $sql);

    if ($result && mysqli_num_rows($result) === 1) {
        $user = mysqli_fetch_assoc($result);

        // Verify the password
        if (password_verify($password, $user['password'])) {
            // Generate a token (for simplicity, use a static token or implement JWT)
            $token = bin2hex(random_bytes(16)); // Example token generation
            $userType = $user['type'];
            // $userFirstName = $user['firstName'];
            // $userLastName = $user['lastName'];
            setcookie('authToken', $token, [
              'expires' => 0, // Expires when the browser is closed
              'path' => '/',
              'httponly' => true, // Prevent access via JavaScript
              'secure' => isset($_SERVER['HTTPS']), // Send only over HTTPS
              'samesite' => 'Strict' // Protect against CSRF
          ]);

            http_response_code(200);
            echo json_encode([
                'success' => true,
                'token' => $token,
                'userType' => $userType
                // 'firstNme' => $userFirstName
                // 'lastName'=> $userLastName
            ]);
        } else {
            http_response_code(401);
            echo json_encode(['error' => [
                'password' => 'Incorrect password. Please try again',
            ]]);
        }
    } else {
        http_response_code(404);
        echo json_encode(['error' => [
            'email' => 'No user found. Please check the email address'
        ]]);
    }
} else {
    http_response_code(400);
    echo json_encode(['error' => 'Invalid request']);
}
