<?php include 'includes/header.php'; ?>

<div class="hero">
    <div class="hero-text">
        <h1 class="glow-text">Arquitecturas Móviles</h1>
        <p style="font-size: 1.2rem; margin-top: 10px; color: #e0e0e0;">
            Patrones de diseño modernos para el desarrollo de aplicaciones eficientes y escalables.
        </p>
    </div>
</div>

<div class="intro-section" style="margin-bottom: 3rem;">
    <h2 style="color: var(--accent-blue); margin-bottom: 1rem;">Bienvenido</h2>
    <p>
        En esta exposición exploraremos los diferentes patrones de arquitectura utilizados en el desarrollo de aplicaciones móviles.
        Desde el clásico MVC hasta las modernas arquitecturas reactivas como MVI, analizaremos sus componentes, ventajas y casos de uso.
    </p>
</div>

<div class="topic-grid">
    <?php
    // Fetch all topics again for the main content area
    $sql_main = "SELECT * FROM temas";
    $result_main = $conn->query($sql_main);

    if ($result_main && $result_main->num_rows > 0) {
        while($row = $result_main->fetch_assoc()) {
            echo '<div class="card">';
            echo '<h2>' . $row["id"] . '. ' . htmlspecialchars($row["titulo"]) . '</h2>';
            echo '<p>' . htmlspecialchars($row["descripcion"]) . '</p>';
            echo '<a href="topic.php?id=' . $row["id"] . '" style="color:var(--accent-purple); text-decoration:none; font-weight:bold; margin-top:1rem; display:inline-block; border-bottom: 1px solid transparent; transition: border 0.3s;">Explorar Tema &rarr;</a>';
            echo '</div>';
        }
    } else {
        echo '<p>No hay temas disponibles en la base de datos.</p>';
    }
    ?>
</div>

<?php include 'includes/footer.php'; ?>
