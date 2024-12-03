<?php
header('Content-Type: application/json');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
require 'connection.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
  http_response_code(200);
  exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    // Parse the pictureID from the query parameter
    if (isset($_GET['pictureID']) && !empty($_GET['pictureID'])) {
        $pictureID = intval($_GET['pictureID']);

        if ($pictureID < 1) {
            http_response_code(400);
            echo json_encode(['message' => 'Invalid pictureID']);
            exit;
        }

        // Fetch data from the main_gallery table
        $query = "SELECT natureLow, natureHigh FROM nature_gallery WHERE pictureID = ?";
        $stmt = $con->prepare($query);
        $stmt->bind_param('i', $pictureID);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 0) {
            http_response_code(404);
            echo json_encode(['message' => 'Image not found']);
            exit;
        }

        $row = $result->fetch_assoc();
        $filePathLow =  $row['natureLow'];
        $filePathHigh = $row['natureHigh'];

        // Delete from the database
        $deleteQuery = "DELETE FROM nature_gallery WHERE pictureID = ? LIMIT 1";
        $stmt = $con->prepare($deleteQuery);
        $stmt->bind_param('i', $pictureID);

        if ($stmt->execute()) {
            // Delete files if they exist
            if (file_exists($filePathLow)) {
                unlink($filePathLow);
            }
            if (file_exists($filePathHigh)) {
                unlink($filePathHigh);
            }

            echo json_encode(['message' => 'Image deleted successfully']);
        } else {
            http_response_code(500);
            echo json_encode(['message' => 'Failed to delete image']);
        }
    } else {
        http_response_code(400);
        echo json_encode(['message' => 'pictureID is required']);
    }
} else {
    http_response_code(405);
    echo json_encode(['message' => 'Method not allowed']);
}
?>
