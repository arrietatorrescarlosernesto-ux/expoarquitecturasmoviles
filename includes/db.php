<?php
// Configuración de la base de datos
$host = 'localhost';
$user = 'root'; // Usuario por defecto de XAMPP/WAMP
$password = ''; // Contraseña por defecto (vacía)
$database = 'mobile_architectures';

// Conexión MySQLi para la aplicación general
$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error) {
    die("Error de conexión (MySQLi): " . $conn->connect_error);
}
$conn->set_charset("utf8mb4");

// Conexión PDO para el API del Cuestionario
try {
    $dsn = "mysql:host=$host;dbname=$database;charset=utf8mb4";
    $pdo = new PDO($dsn, $user, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
} catch (PDOException $e) {
    die("Error de conexión (PDO): " . $e->getMessage());
}
?>