<?php 
// Force UTF-8 header before anything else
header('Content-Type: text/html; charset=utf-8');
include __DIR__ . '/db.php'; 
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arquitecturas Móviles - Exposición</title>
    <link rel="stylesheet" href="css/styles.css?v=<?php echo time(); ?>">
    <!-- Universal System Fonts used in CSS, no external links needed for core text -->
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="logo">Mobile<span style="color:var(--accent-blue)">Arch</span></div>
            <ul class="nav-links">
                <li><a href="index.php">Inicio</a></li>
                <li><a href="about.php">Acerca de</a></li>
            </ul>
        </nav>
    </header>
    
    <div class="container">
        <aside class="sidebar">
            <h3>Arquitecturas móviles</h3>
            <ul class="topic-list">
                <?php
                // Fetch topics for the sidebar menu
                $sql = "SELECT id, titulo FROM temas ORDER BY id ASC";
                $result = $conn->query($sql);
                
                // Get current page ID to highlight active link
                $current_id = isset($_GET['id']) ? intval($_GET['id']) : 0;
                $is_home = basename($_SERVER['PHP_SELF']) == 'index.php';

                echo '<li><a href="index.php" class="' . ($is_home ? 'active' : '') . '">Inicio</a></li>';
                
                if ($result && $result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        // Shorten long titles for sidebar if needed, or keep as is
                        $title = $row["titulo"];
                        $active_class = ($row["id"] == $current_id && !$is_home) ? 'active' : '';
                        echo '<li><a href="topic.php?id=' . $row["id"] . '" class="' . $active_class . '">' . $row["id"] . '. ' . htmlspecialchars($title) . '</a></li>';
                    }
                }
                ?>
            </ul>
        </aside>
        
        <main class="content">
