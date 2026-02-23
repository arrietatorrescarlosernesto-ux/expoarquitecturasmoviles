<?php include 'includes/header.php'; ?>

<?php
// Obtener el ID del tema desde la URL
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($id > 0) {
    // Consultar el tema principal
    $sql_topic = "SELECT * FROM temas WHERE id = $id";
    $res_topic = $conn->query($sql_topic);

    if ($res_topic && $res_topic->num_rows > 0) {
        $topic = $res_topic->fetch_assoc();
?>
        <div class="topic-container">
            <div class="hero" style="background: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.8)), url('/Exposicion/images/intro.jpg'); margin-bottom: 2rem;">
                <div class="hero-text">
                    <h1 class="glow-text" style="font-size: 2.5rem; margin-bottom: 0.5rem;"><?php echo htmlspecialchars($topic["titulo"]); ?></h1>
                    <p style="font-size: 1.2rem; color: #e0e0e0; font-style: italic;">
                        <?php echo htmlspecialchars($topic["descripcion"]); ?>
                    </p>
                </div>
            </div>

            <div class="subtopics-list">
                <?php
                // Consultar los subtemas asociados desde la base de datos
                $sql_subs = "SELECT * FROM subtemas WHERE tema_id = $id ORDER BY id ASC";
                $res_subs = $conn->query($sql_subs);

                if ($res_subs && $res_subs->num_rows > 0) {
                    while ($sub = $res_subs->fetch_assoc()) {
                ?>
                        <div class="subtopic card">
                            <h3><?php echo htmlspecialchars($sub["titulo"]); ?></h3>
                            <div class="subtopic-content">
                                <?php 
                                // El contenido ya viene con formato HTML desde la base de datos
                                echo $sub["contenido"]; 
                                ?>
                            </div>
                        </div>
                <?php
                    }
                } else {
                ?>
                    <div class="card">
                        <h3>Contenido en desarrollo</h3>
                        <p>La información detallada para este tema estará disponible próximamente.</p>
                        <p>Mientras tanto, puedes consultar la documentación oficial o volver al índice.</p>
                    </div>
                <?php
                }
                ?>
            </div>
            
            <div style="margin-top: 3rem; text-align: center;">
                <a href="index.php" class="btn-back" style="
                    display: inline-block;
                    padding: 10px 20px;
                    background: var(--gradient-main);
                    color: white;
                    text-decoration: none;
                    border-radius: 25px;
                    font-weight: bold;
                    transition: transform 0.2s;
                ">
                    &larr; Volver al Inicio
                </a>
            </div>
        </div>
<?php
    } else {
        echo '<div class="card"><h2>Tema no encontrado</h2><p>El tema solicitado no existe en nuestra base de datos.</p></div>';
    }
} else {
    echo '<div class="card"><h2>ID de tema inválido</h2><p>Por favor selecciona un tema válido desde el menú.</p></div>';
}
?>

<?php include 'includes/footer.php'; ?>
