<?php
header('Content-Type: application/json; charset=utf-8');
include 'includes/db.php';

try {
    // Si la conexión PDO no existe en db.php, crearla aquí como fallback
    if (!isset($pdo)) {
        $dsn = "mysql:host=$host;dbname=$database;charset=utf8mb4";
        $pdo = new PDO($dsn, $user, $password, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]);
    } else {
        $pdo->exec("SET NAMES utf8mb4");
    }

    $stmt = $pdo->query("SELECT id, question_text, option_a, option_b, option_c, option_d, correct_option, explanation, tips FROM quiz_questions ORDER BY id ASC");
    $questions = $stmt->fetchAll();
    
    echo json_encode($questions, JSON_UNESCAPED_UNICODE);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => 'General error: ' . $e->getMessage()]);
}
?>