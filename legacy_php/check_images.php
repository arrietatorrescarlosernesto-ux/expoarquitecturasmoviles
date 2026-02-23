<?php
// Script de diagnóstico de imágenes
echo "<h1>Diagnóstico de Imágenes</h1>";

$image_dir = __DIR__ . '/images/';
echo "<p>Directorio de imágenes: " . htmlspecialchars($image_dir) . "</p>";

if (is_dir($image_dir)) {
    echo "<p>El directorio 'images' existe.</p>";
    $files = scandir($image_dir);
    echo "<ul>";
    foreach ($files as $file) {
        if ($file !== '.' && $file !== '..') {
            echo "<li>" . htmlspecialchars($file) . " <br>";
            // Intenta mostrar la imagen
            echo '<img src="images/' . htmlspecialchars($file) . '" style="max-width: 200px; border: 1px solid red;">';
            echo "</li>";
        }
    }
    echo "</ul>";
} else {
    echo "<p style='color:red;'>El directorio 'images' NO existe.</p>";
}

echo "<h2>Prueba de rutas</h2>";
echo "<p>Si ves las imágenes arriba, las rutas relativas funcionan.</p>";
echo "<p>Si ves iconos rotos, verifica permisos o nombres de archivo.</p>";
?>
