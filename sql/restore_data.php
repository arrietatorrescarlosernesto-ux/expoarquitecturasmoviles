<?php
header('Content-Type: text/plain; charset=utf-8');
include __DIR__ . '/../includes/db.php';

// Force UTF8mb4
$conn->set_charset("utf8mb4");
$pdo->exec("SET NAMES utf8mb4");

echo "Iniciando restauración de datos con codificación correcta...\n";

// Definir los datos en arrays de PHP para evitar problemas de piping de consola
$temas = [
    [1, 'Introducción a las arquitecturas móviles', 'Conceptos básicos y objetivos de la arquitectura en el desarrollo móvil.'],
    [2, 'Arquitectura MVC (Model-View-Controller)', 'El patrón clásico que separa la aplicación en tres componentes principales.'],
    [3, 'Arquitectura MVP (Model-View-Presenter)', 'Una evolución de MVC que busca desacoplar la vista del modelo a través de un presentador.'],
    [4, 'Arquitectura MVVM (Model-View-ViewModel)', 'Facilita la separación del desarrollo de la interfaz gráfica del desarrollo de la lógica de negocio.'],
    [5, 'Arquitectura MVI (Model-View-Intent)', 'Un patrón reactivo y unidireccional inspirado en Cycle.js y Redux.'],
    [6, 'Clean Architecture en aplicaciones móviles', 'Arquitectura propuesta por Uncle Bob para crear sistemas independientes de frameworks y UI.'],
    [7, 'Arquitectura en capas (Layered Architecture)', 'Organización del código en capas lógicas como presentación, dominio y datos.'],
    [8, 'Comparación de arquitecturas móviles', 'Análisis comparativo de los diferentes patrones arquitectónicos.'],
    [9, 'Evaluación de Conocimientos', 'Cuestionario interactivo para poner a prueba lo aprendido sobre arquitecturas móviles.']
];

// Limpiar tablas
$conn->query("SET FOREIGN_KEY_CHECKS = 0");
$conn->query("TRUNCATE TABLE subtemas");
$conn->query("TRUNCATE TABLE temas");
$conn->query("TRUNCATE TABLE quiz_questions");
$conn->query("SET FOREIGN_KEY_CHECKS = 1");

// Insertar Temas
$stmt = $conn->prepare("INSERT INTO temas (id, titulo, descripcion) VALUES (?, ?, ?)");
foreach ($temas as $tema) {
    $stmt->bind_param("iss", $tema[0], $tema[1], $tema[2]);
    $stmt->execute();
}
echo "Temas insertados.\n";

// Contenido de Subtemas (Extenso)
// Vamos a leer el archivo SQL línea por línea y extraer los inserts, pero procesándolos en PHP
// O mejor, definimos aquí el contenido crítico que se veía mal.

// Función helper para insertar subtema
function insertarSubtema($conn, $tema_id, $titulo, $contenido) {
    $stmt = $conn->prepare("INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (?, ?, ?)");
    $stmt->bind_param("iss", $tema_id, $titulo, $contenido);
    $stmt->execute();
}

// 1.1 Introducción
$contenido_1_1 = '
<div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
    <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición Formal</h4>
    <p>La arquitectura de software en aplicaciones móviles se define como la <strong>estructura organizativa del software</strong> de una aplicación móvil, donde se establecen los componentes principales, sus responsabilidades y las interacciones entre ellos.</p>
</div>
<p>Esencialmente, es un conjunto de <strong>patrones, principios y técnicas estructurales</strong> que guían el diseño y la implementación del código, asegurando que la aplicación sea eficiente, flexible y adaptable a cambios futuros.</p>
<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/CleanArchitecture.jpg" alt="Clean Architecture Diagram" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
    <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama de Arquitectura Móvil (Clean Architecture)</p>
</div>
<h4 style="margin-top: 2rem; color: var(--accent-purple);">Función Principal</h4>
<p>Su función principal es establecer la base conceptual para construir sistemas escalables y mantenibles.</p>';

insertarSubtema($conn, 1, '1.1 Arquitectura de software en aplicaciones móviles', $contenido_1_1);

// 1.2 Objetivos
$contenido_1_2 = '
<p>Los objetivos de una arquitectura móvil se centran en optimizar el desarrollo y el ciclo de vida de la aplicación:</p>
<div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;"> Organización del Código</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Facilita una estructura modular y clara, reduciendo la complejidad.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #0072ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">️ Mantenimiento</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Código más limpio, fácil de actualizar y corregir.</p>
    </div>
</div>';
insertarSubtema($conn, 1, '1.2 Objetivos de una arquitectura móvil', $contenido_1_2);

// 2.5 MVC Costos (La tabla que pediste extender)
$contenido_2_5 = '
    <p>A continuación se presenta un análisis detallado de costos y evaluación de la arquitectura MVC en aplicaciones móviles, integrando comparaciones con otros modelos y especificando cuándo representa una ventaja o desventaja.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem; margin-bottom: 1rem;"> Análisis de Costos y Evaluación</h4>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 25%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 37.5%; border-right: 1px solid rgba(255,255,255,0.2);"> Cuándo es Ventaja (y por qué)</th>
                    <th style="padding: 15px; text-align: left; width: 37.5%;"> Cuándo es Desventaja (y por qué)</th>
                </tr>
            </thead>
            <tbody>
                <!-- Concepto General -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Concepto General</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Modelo simple.</strong> Es fácil de comprender y estructurar mentalmente.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede volverse complejo y difícil de manejar en aplicaciones grandes.
                    </td>
                </tr>
                <!-- Aprendizaje -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Aprendizaje</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Baja curva de aprendizaje.</strong> Ideal para desarrolladores principiantes.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Requiere mayor disciplina y organización manual.
                    </td>
                </tr>
                 <!-- Implementación -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Implementación</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Rápida implementación en proyectos pequeños o medianos (MVPs).
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        En proyectos complejos puede generar una estructura monolítica.
                    </td>
                </tr>
                 <!-- Costo Inicial -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo Inicial</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Bajo costo.</strong> Requiere configuración mínima.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        La deuda técnica puede aumentar rápidamente.
                    </td>
                </tr>
            </tbody>
        </table>
    </div>';
insertarSubtema($conn, 2, '2.5 Ventajas y Desventajas de la arquitectura MVC', $contenido_2_5);

// Insertar preguntas del Quiz
$quiz_questions = [
    ['¿Cuál es el objetivo principal de una arquitectura de software móvil?', 'Hacer que la app se vea bonita', 'Estructurar el sistema para facilitar mantenimiento y escalabilidad', 'Escribir menos código', 'Usar la última tecnología disponible', 'B', 'La arquitectura busca organizar el código para que sea mantenible, escalable y testable a largo plazo.'],
    ['En el patrón MVC, ¿qué componente es responsable de la lógica de negocio y los datos?', 'Vista (View)', 'Controlador (Controller)', 'Modelo (Model)', 'Usuario', 'C', 'El Modelo encapsula la lógica de negocio y el estado de la aplicación, independiente de la interfaz.'],
    ['¿Cuál es una desventaja común del patrón MVC en aplicaciones complejas?', 'Es demasiado difícil de aprender', 'El Controlador tiende a volverse masivo (Massive View Controller)', 'No permite usar bases de datos', 'La Vista no se puede actualizar', 'B', 'En apps grandes, el Controlador asume demasiadas responsabilidades, volviéndose difícil de mantener.']
];

$stmt_quiz = $conn->prepare("INSERT INTO quiz_questions (question_text, option_a, option_b, option_c, option_d, correct_option, explanation) VALUES (?, ?, ?, ?, ?, ?, ?)");
foreach ($quiz_questions as $q) {
    $stmt_quiz->bind_param("sssssss", $q[0], $q[1], $q[2], $q[3], $q[4], $q[5], $q[6]);
    $stmt_quiz->execute();
}
echo "Cuestionario insertado.\n";

echo "Restauración completada con éxito.";
?>