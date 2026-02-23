<?php
header('Content-Type: application/json; charset=utf-8');
include 'includes/db.php';

$data = [
    'topics' => [],
    'quiz' => []
];

// 1. Fetch Topics and Subtopics
$sql_temas = "SELECT * FROM temas ORDER BY id ASC";
$result_temas = $conn->query($sql_temas);

if ($result_temas) {
    while($tema = $result_temas->fetch_assoc()) {
        $tema_id = $tema['id'];
        $tema_data = [
            'id' => $tema['id'],
            'title' => $tema['titulo'],
            'description' => $tema['descripcion'],
            'subtopics' => []
        ];

        // Fetch subtopics for this topic
        $sql_sub = "SELECT * FROM subtemas WHERE tema_id = $tema_id ORDER BY id ASC";
        $result_sub = $conn->query($sql_sub);
        if ($result_sub) {
            while($sub = $result_sub->fetch_assoc()) {
                $tema_data['subtopics'][] = [
                    'title' => $sub['titulo'],
                    'content' => $sub['contenido']
                ];
            }
        }
        $data['topics'][] = $tema_data;
    }
}

// 2. Fetch Quiz Questions
$sql_quiz = "SELECT * FROM quiz_questions ORDER BY id ASC";
$result_quiz = $conn->query($sql_quiz);

if ($result_quiz) {
    while($q = $result_quiz->fetch_assoc()) {
        $data['quiz'][] = $q;
    }
}

// Write to file
file_put_contents('data.json', json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));

echo "Datos exportados correctamente a data.json";
?>