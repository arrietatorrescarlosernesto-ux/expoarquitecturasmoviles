<?php
include 'includes/db.php';

echo "<h1>Diagnóstico de Contenido en Base de Datos</h1>";
echo "<p>Este script muestra qué código HTML está guardado realmente en tu base de datos.</p>";
echo "<hr>";

// Consultar subtemas del Tema 2 (MVC)
$sql = "SELECT id, titulo, contenido FROM subtemas WHERE tema_id = 2";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<h3>Subtema: " . htmlspecialchars($row['titulo']) . " (ID: " . $row['id'] . ")</h3>";
        
        // Buscar etiquetas de imagen en el contenido
        if (strpos($row['contenido'], '<img') !== false) {
            echo "<p style='color:green; font-weight:bold;'> Se encontraron imágenes en este contenido.</p>";
            
            // Extraer y mostrar las rutas de las imágenes encontradas
            preg_match_all('/<img[^>]+src="([^">]+)"/', $row['contenido'], $matches);
            if (!empty($matches[1])) {
                echo "<ul>";
                foreach ($matches[1] as $src) {
                    echo "<li>Ruta detectada: <code>" . htmlspecialchars($src) . "</code></li>";
                }
                echo "</ul>";
            }
        } else {
            echo "<p style='color:red; font-weight:bold;'> NO se encontraron imágenes en este contenido.</p>";
            echo "<p><em>Esto indica que el script SQL de actualización no se ha ejecutado correctamente.</em></p>";
        }
        
        echo "<details>";
        echo "<summary>Ver contenido HTML completo (clic aquí)</summary>";
        echo "<pre style='background:#f4f4f4; padding:10px; border:1px solid #ddd; white-space:pre-wrap;'>" . htmlspecialchars($row['contenido']) . "</pre>";
        echo "</details>";
        echo "<hr>";
    }
} else {
    echo "<p style='color:red;'>No se encontraron subtemas para el Tema 2.</p>";
}
?>
