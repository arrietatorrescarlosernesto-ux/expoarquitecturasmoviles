<?php
header('Content-Type: text/plain; charset=utf-8');
include __DIR__ . '/../includes/db.php';

// Force UTF8mb4 connection
$conn->set_charset("utf8mb4");
if (isset($pdo)) {
    $pdo->exec("SET NAMES utf8mb4");
}

echo "Iniciando restauración MASIVA Y PROFUNDA de datos...\n";

// 1. Limpiar tablas y asegurar estructura
$conn->query("SET FOREIGN_KEY_CHECKS = 0");
$conn->query("TRUNCATE TABLE subtemas");
$conn->query("TRUNCATE TABLE temas");
$conn->query("DROP TABLE IF EXISTS quiz_questions");
$conn->query("CREATE TABLE quiz_questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT NOT NULL,
    option_a TEXT NOT NULL,
    option_b TEXT NOT NULL,
    option_c TEXT NOT NULL,
    option_d TEXT NOT NULL,
    correct_option CHAR(1) NOT NULL,
    explanation TEXT NOT NULL,
    tips TEXT NOT NULL -- JSON Array
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
$conn->query("SET FOREIGN_KEY_CHECKS = 1");

// Helper para insertar
function insertTopic($conn, $id, $title, $desc) {
    $stmt = $conn->prepare("INSERT INTO temas (id, titulo, descripcion) VALUES (?, ?, ?)");
    $stmt->bind_param("iss", $id, $title, $desc);
    $stmt->execute();
}

function insertSubtopic($conn, $tema_id, $title, $content) {
    $stmt = $conn->prepare("INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (?, ?, ?)");
    $stmt->bind_param("iss", $tema_id, $title, $content);
    $stmt->execute();
}

// ======================================================================================
// TEMA 1: INTRODUCCIÓN
// ======================================================================================
insertTopic($conn, 1, 'Introducción a las arquitecturas móviles', 'Fundamentos esenciales, definiciones y objetivos críticos para el desarrollo de software móvil moderno.');

$content_1_1 = '
<div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
    <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición Formal</h4>
    <p>La arquitectura de software en aplicaciones móviles se define como la <strong>estructura organizativa fundamental</strong> de un sistema de software. No se trata solo de escribir código, sino de tomar decisiones de diseño críticas sobre los componentes principales, sus responsabilidades, las relaciones entre ellos y cómo interactúan con el sistema operativo (Android/iOS) y servicios externos.</p>
</div>
<p>Esencialmente, es el "esqueleto" que sostiene la aplicación. Una buena arquitectura es un conjunto de <strong>patrones, principios y técnicas estructurales</strong> que guían el desarrollo, asegurando que la aplicación sea:</p>
<ul style="margin-left: 20px; color: #ccc; margin-bottom: 1rem;">
    <li><strong>Robusta:</strong> Capaz de manejar errores y condiciones inesperadas sin colapsar ante el usuario.</li>
    <li><strong>Flexible:</strong> Adaptable a nuevos requisitos del mercado sin necesidad de reescribir todo el código base.</li>
    <li><strong>Eficiente:</strong> Optimizada para el consumo de batería, memoria y datos móviles, recursos que son críticos y limitados en dispositivos móviles.</li>
</ul>
<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/CleanArchitecture.jpg" alt="Clean Architecture Diagram" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
    <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Representación visual de capas en una arquitectura robusta (Clean Architecture).</p>
</div>
<h4 style="margin-top: 2rem; color: var(--accent-purple);">Importancia Estratégica</h4>
<p>En el competitivo mercado actual, una aplicación sin arquitectura es una bomba de tiempo. A medida que crece, se vuelve imposible de mantener (fenómeno conocido como "Spaghetti Code"), lo que lleva a bugs frecuentes, desinstalaciones por parte de los usuarios y costos de desarrollo insostenibles. Una arquitectura sólida es la diferencia entre un producto exitoso a largo plazo y uno que fracasa tras la primera versión.</p>';
insertSubtopic($conn, 1, '1.1 Arquitectura de software en aplicaciones móviles', $content_1_1);

$content_1_2 = '
<p>Los objetivos de una arquitectura móvil van más allá de la simple organización; buscan garantizar la longevidad y calidad del producto a través de principios sólidos de ingeniería de software:</p>
<div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🧩 Organización y Modularidad</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Descomponer el sistema en módulos independientes permite que múltiples desarrolladores trabajen en paralelo sin bloquearse mutuamente. Facilita la reutilización de código en diferentes partes de la app y reduce la duplicación.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #0072ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🛠️ Mantenibilidad y Testabilidad</h4>
        <p style="font-size: 0.9rem; color: #aaa;">El código debe ser fácil de leer y probar. Una buena arquitectura permite escribir tests unitarios automatizados que garantizan que los cambios no rompan funcionalidades existentes, reduciendo drásticamente la necesidad de QA manual repetitivo.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">📈 Escalabilidad</h4>
        <p style="font-size: 0.9rem; color: #aaa;">La capacidad de agregar nuevas características (features) de forma constante sin que la complejidad del código crezca exponencialmente. Permite a la app crecer de 10 a 100 pantallas de manera ordenada y predecible.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🎭 Separación de Responsabilidades (SoC)</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Cada componente debe tener una única razón para cambiar. La UI no debe saber de base de datos, y la lógica no debe saber de píxeles. Esto desacopla las dependencias y hace el sistema más robusto ante cambios.</p>
    </div>
</div>';
insertSubtopic($conn, 1, '1.2 Objetivos de una arquitectura móvil', $content_1_2);


// ======================================================================================
// TEMA 2: MVC
// ======================================================================================
insertTopic($conn, 2, 'Arquitectura MVC (Model–View–Controller)', 'El patrón clásico y fundamental. Análisis profundo de sus componentes, flujo y viabilidad actual.');

$content_2_1 = '
<div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
    <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición de MVC</h4>
    <p>MVC (Model-View-Controller) se define como una arquitectura o patrón de diseño que divide la aplicación en tres componentes principales interconectados: Modelo (Model), Vista (View) y Controlador (Controller), con el objetivo principal de separar la lógica de negocio y los datos de la interfaz de usuario, promoviendo una mejor organización, mantenimiento y escalabilidad del código.</p>
</div>
<p>Este patrón, originado en los años 70 para interfaces gráficas, es ampliamente utilizado en desarrollo móvil (como en Android con Activities como Controllers, o iOS con UIViewControllers), ya que facilita la separación de preocupaciones (separation of concerns), permitiendo que cambios en la UI no afecten la lógica de datos y viceversa.</p>
<p>En apps móviles, MVC organiza el código en capas, donde el flujo típico es: el usuario interactúa con la View, que notifica al Controller; este actualiza el Model y refresca la View, asegurando eficiencia en entornos con recursos limitados como batería o memoria. Aunque no es estrictamente implementado en frameworks móviles modernos (que prefieren MVVM o MVP para mejor testabilidad), MVC sirve como base para apps simples, reduciendo complejidad y facilitando colaboración en equipos. En resumen, MVC es un patrón clásico que transforma el desarrollo de apps complejas en un proceso manejable, alineado con principios de modularidad y reutilización.</p>
<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/MVC3.webp" alt="MVC Design Pattern GeeksforGeeks" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
    <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama ilustrativo de MVC mostrando el flujo de interacción.</p>
</div>';
insertSubtopic($conn, 2, '2.1 Definición y Concepto', $content_2_1);

$content_2_2 = '
<p>Los componentes de MVC se dividen en tres roles interconectados, cada uno con responsabilidades específicas para mantener la separación de preocupaciones en aplicaciones móviles. A continuación, se explica el rol de cada uno, con ejemplos en contextos como Android o iOS.</p>
<div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">📦 Modelo (Model)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Gestiona los datos y la lógica de negocio de la aplicación, representando entidades del mundo real (como usuarios o productos). Es responsable de almacenar, recuperar y manipular datos (desde bases de datos, APIs o redes), aplicar reglas de negocio, validar datos y mantener la integridad sin conocimiento de la UI. En apps móviles, el Model se actualiza independientemente, permitiendo pruebas unitarias fáciles y reutilización en diferentes vistas. Por ejemplo, en una app de e-commerce, el Model maneja el inventario y cálculos de precios, notificando al Controller de cambios.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">👁️ Vista (View)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Se encarga de la interfaz de usuario, presentando los datos del Model de manera visual y manejando interacciones del usuario (como botones, listas o formularios). Es pasiva, enfocándose en la renderización y no en la lógica de datos; en móviles, incluye elementos como XML layouts en Android o Storyboards en iOS. La View observa cambios en el Model (vía Controller) para actualizarse automáticamente. Ejemplo: en una app de clima, la View muestra temperaturas y gráficos sin procesar los datos crudos.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🎮 Controlador (Controller)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Actúa como intermediario entre Model y View, procesando entradas del usuario (eventos como clics), actualizando el Model según sea necesario y refrescando la View con los datos actualizados. Contiene la lógica de aplicación principal, enrutando comandos y manejando el flujo. En móviles, como en Android Activities o iOS Controllers, puede volverse "masivo" en apps complejas si no se gestiona bien. Ejemplo: en una app de login, el Controller valida credenciales del Model y navega a la siguiente View.</p>
    </div>
</div>
<p style="margin-top: 1.5rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 6px;">Estos componentes interactúan unidireccionalmente: <strong>View → Controller → Model → Controller → View</strong>, asegurando flujo eficiente.</p>';
insertSubtopic($conn, 2, '2.2 Componentes Detallados', $content_2_2);

$content_2_3 = '
<h4 style="color: var(--accent-purple); margin-bottom: 1rem;">Flujo de Comunicación en MVC</h4>
<p>Este subtema describe cómo fluye la información entre el Modelo, la Vista y el Controlador en MVC, destacando la manera en que las acciones del usuario desencadenan cambios en el sistema. El flujo es unidireccional y cíclico, basado en el principio de separación de preocupaciones, donde el Controlador actúa como mediador para evitar acoplamientos directos entre Modelo y Vista, asegurando modularidad y facilidad de mantenimiento. En aplicaciones móviles, este flujo optimiza el manejo de eventos asíncronos (como toques en pantalla o actualizaciones de red), reduciendo el uso de batería y memoria al procesar solo cambios necesarios.</p>

<p>El flujo típico de comunicación es el siguiente, paso a paso:</p>
<ol style="margin-left: 1.5rem; color: #e0e0e0; margin-top: 1rem;">
    <li style="margin-bottom: 0.5rem;"><strong>Acción del usuario en la Vista:</strong> El usuario interactúa con la interfaz (por ejemplo, presiona un botón o envía un formulario), generando un evento o entrada que se envía al Controlador. Esto desencadena el proceso, como en una app de lista de tareas donde el usuario agrega un ítem.</li>
    <li style="margin-bottom: 0.5rem;"><strong>Procesamiento en el Controlador:</strong> El Controlador recibe la entrada, la valida, aplica lógica de aplicación y decide si actualizar el Modelo (por ejemplo, guardando nuevos datos).</li>
    <li style="margin-bottom: 0.5rem;"><strong>Actualización del Modelo:</strong> El Modelo procesa los cambios (por ejemplo, interactuando con una base de datos o API), actualiza sus datos y notifica al Controlador (o directamente a la Vista en variantes observadoras) de las modificaciones.</li>
    <li style="margin-bottom: 0.5rem;"><strong>Refresco de la Vista:</strong> El Controlador recibe la notificación del Modelo, obtiene los datos actualizados y los envía a la Vista para que se actualice y muestre los cambios al usuario.</li>
</ol>

<p>Este flujo asegura que las actualizaciones sean reactivas y eficientes, con notificaciones basadas en eventos (como observers o callbacks) para manejar cambios asíncronos comunes en móviles. En resumen, las acciones del usuario inician un ciclo que propaga cambios de manera controlada, previniendo dependencias directas y facilitando depuración.</p>

<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/mvc.jpg" alt="Diagrama ilustrativo del flujo de comunicación en MVC" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
    <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama ilustrativo del flujo de comunicación en MVC</p>
</div>';
insertSubtopic($conn, 2, '2.3 Flujo de Comunicación en MVC (Móvil)', $content_2_3);

$content_2_4 = '
<h4 style="color: var(--accent-blue); margin-bottom: 1rem;">Aplicación de MVC en Entornos Móviles</h4>
<p>Se analiza cómo se implementa MVC en aplicaciones móviles y las particularidades que presenta en plataformas como Android e iOS, donde algunos componentes pueden combinar responsabilidades para optimizar rendimiento en dispositivos con recursos limitados (como batería y memoria). MVC es ideal para apps simples o medianas, facilitando desarrollo rápido y navegación básica, pero en proyectos complejos puede llevar a "controladores masivos" (massive view controllers), donde el Controlador acumula lógica excesiva, reduciendo testabilidad. En móviles, se adapta a ciclos de vida de componentes (como Activities en Android o ViewControllers en iOS), manejando eventos como rotaciones de pantalla o terminaciones de app.</p>

<h5 style="color: var(--accent-purple); margin-top: 1.5rem;">Implementación en Android</h5>
<p>En Android, MVC se implementa con Activities o Fragments como Controladores (manejan lógica y eventos), layouts XML como Vistas (UI pasiva), y clases POJO o bases de datos como Modelos (lógica de datos). Particularidades: Los Controladores (Activities) combinan responsabilidades de UI y lógica para eficiencia, pero esto puede inflar clases; se usa con adapters para listas. Recomendado para apps simples, aunque Google favorece MVVM para testabilidad. Ejemplo: En una app de chat, el Activity (Controller) actualiza un ListView (View) con datos de Firebase (Model).</p>

<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <!-- Placeholder for Android MVC Diagram if available, reusing generic or description -->
    <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama conceptual de MVC en Android</p>
</div>

<h5 style="color: var(--accent-purple); margin-top: 1.5rem;">Implementación en iOS</h5>
<p>En iOS, MVC es el patrón nativo promovido por Apple: UIViewController combina roles de Vista y Controlador (manejan UI y lógica), mientras que Modelos son clases separadas para datos. Particularidades: La combinación en UIViewController optimiza para interfaces táctiles, pero lleva a "massive view controllers"; se usa con UIKit o SwiftUI. Ideal para apps con lógica de negocio simple, extensible con patrones como delegates. Ejemplo: En una app de to-do, el UIViewController (Controller) actualiza una UITableView (View) con datos de un array (Model).</p>

<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <!-- Placeholder for iOS MVC Diagram if available -->
    <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama conceptual de MVC en iOS</p>
</div>

<p>En ambos plataformas, MVC facilita desarrollo inicial pero evoluciona a MVVM para apps complejas.</p>';
insertSubtopic($conn, 2, '2.4 Aplicación de MVC en Entornos Móviles', $content_2_4);

$content_2_4_1 = '
<h4 style="color: var(--accent-blue); margin-bottom: 1rem;">Caso de Estudio: Lista de Tareas (To-Do List)</h4>
<p>Para ilustrar MVC, imaginemos una pantalla simple de gestión de tareas. La estructura sería:</p>
<ul style="margin-left: 20px; color: #ccc; margin-bottom: 1.5rem;">
    <li><strong>Model:</strong> Una clase `Task` (data class) y un `TaskRepository` que gestiona la lista `List<Task>`.</li>
    <li><strong>View:</strong> Un archivo de layout `activity_main.xml` con un `RecyclerView` y un botón flotante.</li>
    <li><strong>Controller:</strong> La clase `MainActivity.kt` que orquesta todo.</li>
</ul>

<div style="background: #1e1e1e; padding: 1rem; border-radius: 6px; border: 1px solid #333; overflow-x: auto;">
    <h5 style="color: #98c379; margin-bottom: 0.5rem; font-family: monospace;">Código Simplificado (Kotlin)</h5>
<pre style="margin: 0; color: #abb2bf; font-family: \'Fira Code\', monospace; font-size: 0.85rem;"><code><span style="color: #7f848e;">// MODEL</span>
<span style="color: #c678dd;">data class</span> <span style="color: #e5c07b;">Task</span>(<span style="color: #c678dd;">val</span> id: <span style="color: #e5c07b;">Int</span>, <span style="color: #c678dd;">val</span> title: <span style="color: #e5c07b;">String</span>)

<span style="color: #c678dd;">object</span> <span style="color: #e5c07b;">TaskRepository</span> {
    <span style="color: #c678dd;">private val</span> tasks = mutableListOf&lt;<span style="color: #e5c07b;">Task</span>&gt;()
    
    <span style="color: #7f848e;">// Interface para notificar cambios (Observer Pattern)</span>
    <span style="color: #c678dd;">interface</span> <span style="color: #e5c07b;">OnTasksChangedListener</span> {
        <span style="color: #c678dd;">fun</span> <span style="color: #61afef;">onTasksChanged</span>(newTasks: <span style="color: #e5c07b;">List</span>&lt;<span style="color: #e5c07b;">Task</span>&gt;)
    }
    <span style="color: #c678dd;">var</span> listener: <span style="color: #e5c07b;">OnTasksChangedListener</span>? = <span style="color: #d19a66;">null</span>

    <span style="color: #c678dd;">fun</span> <span style="color: #61afef;">addTask</span>(title: <span style="color: #e5c07b;">String</span>) {
        tasks.add(<span style="color: #e5c07b;">Task</span>(tasks.size, title))
        listener?.onTasksChanged(tasks) <span style="color: #7f848e;">// Notifica al observer</span>
    }
}

<span style="color: #7f848e;">// VIEW & CONTROLLER (Frecuentemente acoplados en Android clásico)</span>
<span style="color: #c678dd;">class</span> <span style="color: #e5c07b;">MainActivity</span> : <span style="color: #e5c07b;">AppCompatActivity</span>(), <span style="color: #e5c07b;">TaskRepository.OnTasksChangedListener</span> {
    <span style="color: #c678dd;">private lateinit var</span> addButton: <span style="color: #e5c07b;">Button</span>
    <span style="color: #c678dd;">private lateinit var</span> recyclerView: <span style="color: #e5c07b;">RecyclerView</span>

    <span style="color: #c678dd;">override fun</span> <span style="color: #61afef;">onCreate</span>(savedInstanceState: <span style="color: #e5c07b;">Bundle</span>?) {
        <span style="color: #e5c07b;">super</span>.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        <span style="color: #7f848e;">// Setup View</span>
        addButton = findViewById(R.id.fab_add)
        recyclerView = findViewById(R.id.recycler_tasks)

        <span style="color: #7f848e;">// CONTROLLER LOGIC: Suscripción y manejo de eventos</span>
        <span style="color: #e5c07b;">TaskRepository</span>.listener = <span style="color: #e5c07b;">this</span>

        addButton.setOnClickListener {
            <span style="color: #7f848e;">// Controller actualiza Model</span>
            <span style="color: #e5c07b;">TaskRepository</span>.addTask(<span style="color: #98c379;">"Nueva Tarea ${System.currentTimeMillis()}"</span>)
        }
    }

    <span style="color: #7f848e;">// VIEW UPDATE: Reacción al cambio del Modelo</span>
    <span style="color: #c678dd;">override fun</span> <span style="color: #61afef;">onTasksChanged</span>(newTasks: <span style="color: #e5c07b;">List</span>&lt;<span style="color: #e5c07b;">Task</span>&gt;) {
        <span style="color: #7f848e;">// La Vista se redibuja con los datos frescos</span>
        myAdapter.submitList(newTasks)
    }
}</code></pre>
</div>
<p style="margin-top: 1rem; font-style: italic; color: #888; border-left: 3px solid #e5c07b; padding-left: 10px;"><strong>Nota Crítica:</strong> En este ejemplo clásico, se observa cómo la <code>Activity</code> actúa simultáneamente como Controlador (gestiona clicks) y como Vista (actualiza el RecyclerView). Esto demuestra el problema de "Acoplamiento Estrecho" inherente a MVC en Android, lo que a menudo lleva a clases masivas difíciles de testear.</p>';
insertSubtopic($conn, 2, '2.4.1 Ejemplo Práctico (Kotlin/Swift)', $content_2_4_1);

$content_2_5 = '
<p>A continuación se presenta un análisis detallado de las ventajas y desventajas de implementar MVC en el contexto actual del desarrollo móvil.</p>
<div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
    <table style="width: 100%; border-collapse: collapse; min-width: 900px; font-size: 0.95rem;">
        <thead>
            <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Ventaja (Por qué y Cuándo)</th>
                <th style="padding: 15px; text-align: left; width: 40%;">❌ Desventaja (Por qué y Cuándo)</th>
            </tr>
        </thead>
        <tbody>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial y Curva de Aprendizaje</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;"><strong>Muy Bajo.</strong> Es el patrón más intuitivo y fácil de entender para desarrolladores junior. La separación mental (Datos vs UI) es natural. Ideal para equipos con poca experiencia.</td>
                <td style="padding: 15px; color: #ccc;">A medida que el equipo crece, la falta de reglas estrictas sobre dónde poner la lógica de presentación lleva a inconsistencias graves.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;"><strong>Rápido.</strong> Perfecto para prototipos, MVPs (Producto Mínimo Viable) o Hackathons donde la velocidad de entrega es prioritaria sobre la calidad del código.</td>
                <td style="padding: 15px; color: #ccc;">El desarrollo se ralentiza exponencialmente en fases tardías debido a la deuda técnica acumulada y la dificultad para refactorizar "God Classes".</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Aceptable en aplicaciones muy pequeñas con pocas pantallas y lógica simple.</td>
                <td style="padding: 15px; color: #ccc;"><strong>Pésimo en apps grandes.</strong> Surge el problema del "Massive View Controller", donde los controladores tienen miles de líneas de código, haciendo imposible su mantenimiento.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">El Modelo (Lógica de negocio pura) se puede probar unitariamente sin problemas.</td>
                <td style="padding: 15px; color: #ccc;"><strong>Muy Difícil.</strong> La lógica de UI está fuertemente acoplada al Controlador y a las librerías del sistema (Android SDK/UIKit), lo que impide realizar pruebas unitarias fáciles sin emuladores lentos.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Limitada. Funciona bien hasta cierto punto de complejidad.</td>
                <td style="padding: 15px; color: #ccc;">Baja. Al crecer la aplicación, el acoplamiento entre Vista y Controlador hace que añadir nuevas funcionalidades sea riesgoso y propenso a errores de regresión.</td>
            </tr>
        </tbody>
    </table>
</div>';
insertSubtopic($conn, 2, '2.5 Análisis de Costos y Evaluación', $content_2_5);


// ======================================================================================
// TEMA 3: MVP
// ======================================================================================
insertTopic($conn, 3, 'Arquitectura MVP (Model–View–Presenter)', 'La evolución orientada a la testabilidad. Desacoplamiento estricto mediante contratos e interfaces.');

$content_3_1 = '
<div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
    <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">3.1 Definición de MVP</h4>
    <p>MVP (Model-View-Presenter) se define como una arquitectura que reemplaza el controlador por un presentador, el cual contiene la lógica de presentación y controla directamente la comunicación con la vista, separando estrictamente la interfaz de usuario de la lógica de negocio y datos para promover modularity, testabilidad y un código más limpio y mantenible. Este patrón, derivado de MVC en los años 90 por empresas como Taligent y popularizado en entornos como Microsoft y Android, surgió para abordar limitaciones de MVC, como el acoplamiento entre Vista y Modelo, al hacer la Vista pasiva y centralizar la lógica en un Presentador independiente del framework UI.</p>
</div>
<p>En aplicaciones móviles, MVP organiza el sistema en tres componentes interconectados: Modelo (datos y lógica de dominio, como interacciones con APIs o bases de datos), Vista (UI pasiva que solo renderiza y captura eventos), y Presentador (intermediario que procesa inputs, aplica reglas de presentación y actualiza la Vista vía interfaces o contratos, sin dependencias directas a componentes Android/iOS como Activities o UIViewControllers).</p>
<p>Esta estructura facilita el manejo de desafíos móviles como ciclos de vida volátiles (ej. onDestroy en Android) y recursos limitados, permitiendo pruebas unitarias del Presentador sin emular UI, y mejorando la escalabilidad al evitar "controladores masivos" comunes en MVC. Aunque fue dominante en Android alrededor de 2015-2020 para apps con lógica compleja, en iOS es menos común debido al MVC nativo, pero se aplica en escenarios que requieren alta testabilidad; en 2026, ha evolucionado hacia MVVM con herramientas como Jetpack o SwiftUI para binding automático. En resumen, MVP es un patrón que prioriza la separación de preocupaciones mediante un Presentador como único puente, transformando el desarrollo de apps móviles en un proceso más robusto y eficiente comparado con patrones tradicionales.</p>

<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/mvp.png" alt="Diagrama ilustrativo de MVP" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
</div>';
insertSubtopic($conn, 3, '3.1 Definición de MVP', $content_3_1);

$content_3_2 = '
<h4 style="color: var(--accent-blue); margin-bottom: 1rem;">3.2 Arquitectura Interna y Comunicación en MVP</h4>
<p>Se detallan las responsabilidades del modelo, la vista y el presentador, destacando que la vista actúa de forma pasiva y delega la lógica al presentador. Este subtema explica cómo la vista se comunica con el presentador mediante interfaces, y cómo el presentador actualiza la vista, mejorando la organización del código.</p>
<p>La arquitectura interna de MVP se estructura en tres componentes desconectados físicamente pero interconectados lógicamente mediante interfaces o contratos, promoviendo un desacoplamiento estricto que facilita la inyección de dependencias (DI) y el principio de inversión de dependencias (DIP), alineado con SOLID para código robusto y extensible. En apps móviles, esta interna optimiza el manejo de estados asíncronos y ciclos de vida, reduciendo fugas de memoria al permitir que el Presentador se desacople de la Vista durante pausas.</p>

<div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">📦 Modelo (Model)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Responsable de la gestión de datos y lógica de dominio, incluyendo persistencia (ej. Room, Core Data), llamadas a APIs (Retrofit, Alamofire), validaciones de negocio y manejo de estados offline/online. No contiene lógica de presentación ni referencias a UI. Soporta patrones como Repository para múltiples fuentes de datos, asegurando idempotencia en operaciones asíncronas.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">👁️ Vista (View)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Pasiva y enfocada en UI; renderiza elementos (RecyclerView, UITableView), captura eventos de usuario y los delega al Presentador sin procesamiento. No accede al Modelo ni contiene lógica condicional; solo implementa interfaces para recibir actualizaciones. Esto reduce complejidad en la Vista, facilitando adaptaciones a diferentes dispositivos.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🎤 Presentador (Presenter)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Centraliza la lógica de presentación (formateo de datos, validaciones UI, manejo de errores) y actúa como único puente; recibe eventos de Vista, consulta/actualiza Modelo y envía datos procesados a Vista. Independiente de UI para testabilidad; usa DI para inyección. En profundidad, maneja estados con máquinas de estado finitas para flujos complejos.</p>
    </div>
</div>';
insertSubtopic($conn, 3, '3.2 Componentes de MVP', $content_3_2);

$content_3_3 = '
<h4 style="color: var(--accent-purple); margin-bottom: 1rem;">3.3 Flujo de Comunicación View–Presenter</h4>
<p>Este subtema explica cómo la vista se comunica con el presentador mediante interfaces, y cómo el presentador actualiza la vista, mejorando la organización del código al promover desacoplamiento, testabilidad y reutilización en apps móviles. El flujo es bidireccional pero controlado: la Vista (pasiva) envía eventos al Presentador vía interfaces (contratos), evitando dependencias directas; el Presentador procesa, interactúa con el Modelo y actualiza la Vista.</p>

<div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
    <h5 style="color: #fff; margin-bottom: 1rem;">Ciclo de Comunicación Típico:</h5>
    <ol style="margin-left: 1.5rem; color: #e0e0e0;">
        <li style="margin-bottom: 1rem;"><strong>Interacción del usuario en la Vista:</strong> Captura eventos (ej. clic) y notifica al Presentador vía interfaz (ej. `presenter.onButtonClick()`).</li>
        <li style="margin-bottom: 1rem;"><strong>Procesamiento en el Presentador:</strong> Recibe la notificación, aplica lógica, interactúa con el Modelo (ej. fetch data).</li>
        <li style="margin-bottom: 1rem;"><strong>Actualización de la Vista:</strong> Presentador envía datos formateados a la Vista vía interfaz (ej. `view.showData(data)`), que refresca la UI.</li>
    </ol>
</div>
<p style="margin-top: 1rem;">Esto mejora organización al centralizar lógica en el Presentador, reduciendo acoplamiento.</p>

<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <!-- Placeholder or generic flow diagram -->
    <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama del flujo de comunicación View-Presenter</p>
</div>';
insertSubtopic($conn, 3, '3.3 Flujo de Comunicación View–Presenter', $content_3_3);

$content_3_4 = '
<h4 style="color: var(--accent-blue); margin-bottom: 1rem;">3.4 Diferencias Estructurales entre MVC y MVP</h4>
<p>Se comparan ambas arquitecturas, resaltando que MVP ofrece una separación más clara de responsabilidades que MVC, al centralizar la lógica en un Presentador independiente y eliminar el acoplamiento directo entre Vista y Modelo, lo que resulta en una estructura más modular y testable.</p>
<p>Estructuralmente, MVC se basa en un Controlador que orquesta el flujo pero permite que la Vista acceda directamente al Modelo, creando dependencias bidireccionales y potenciales inflados en el Controlador (como "Massive View Controller" en iOS o "God Activity" en Android), mientras MVP introduce un Presentador como único mediador, haciendo la Vista completamente pasiva y utilizando interfaces para comunicación unidireccional (push de datos), alineado con principios SOLID como la inversión de dependencias para mayor extensibilidad.</p>
<p>En MVC, el Modelo y la Vista pueden comunicarse bidireccionalmente (Vista "tira" datos del Modelo), lo que simplifica implementaciones iniciales pero complica el mantenimiento en apps móviles con estados dinámicos (ej. manejo de configuraciones como dark mode o multitarea), mientras MVP impone un flujo unidireccional (Vista envía eventos al Presentador, que "empuja" datos procesados), reduciendo complejidad cíclica y facilitando inyección de dependencias (DI) para escalabilidad.</p>
<p>En contextos móviles, MVC es más nativo y simple para prototipos (ej. UIKit en iOS), pero MVP brilla en Android para apps con lógica asíncrona (ej. RxJava o Coroutines), ofreciendo una separación que previene violaciones de principios como SRP (Single Responsibility Principle) al distribuir responsabilidades de manera más granular.</p>

<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <!-- Placeholder for comparative diagram -->
    <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama comparativo estructural MVC vs MVP</p>
</div>';
insertSubtopic($conn, 3, '3.4 Diferencias Estructurales entre MVC y MVP', $content_3_4);

$content_3_5 = '
<p>Tabla detallada de evaluación para la arquitectura MVP.</p>
<div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
    <table style="width: 100%; border-collapse: collapse; min-width: 900px; font-size: 0.95rem;">
        <thead>
            <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Ventaja (Por qué y Cuándo)</th>
                <th style="padding: 15px; text-align: left; width: 40%;">❌ Desventaja (Por qué y Cuándo)</th>
            </tr>
        </thead>
        <tbody>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;"><strong>Excelente.</strong> Es su mayor fortaleza. Al aislar el Presentador en código Java/Kotlin/Swift puro, se pueden probar flujos de UI completos usando JUnit y Mockito en milisegundos, sin necesidad de emuladores.</td>
                <td style="padding: 15px; color: #ccc;">Requiere escribir una gran cantidad de Mocks para simular el comportamiento de las Vistas, lo cual puede ser tedioso al inicio.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Muy bueno. La separación de responsabilidades es clara y forzada por interfaces. Si cambia el diseño visual, la lógica en el Presentador permanece intacta.</td>
                <td style="padding: 15px; color: #ccc;"><strong>Verbosidad Extrema.</strong> Por cada pantalla simple necesitas crear: ViewInterface, PresenterInterface, PresenterImplementation y la ViewImplementation (Activity). Genera mucho código "boilerplate".</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Alta. Permite equipos grandes trabajando en paralelo (unos en Vistas, otros en Presentadores) gracias a los contratos de interfaz definidos previamente.</td>
                <td style="padding: 15px; color: #ccc;">El Presentador puede volverse muy grande ("God Presenter") si maneja demasiada lógica de negocio que debería estar en el Modelo o Dominio.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Curva de Aprendizaje</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Media. Conceptualmente es fácil de entender para quien viene de MVC.</td>
                <td style="padding: 15px; color: #ccc;">Requiere disciplina férrea para no romper el patrón y llamar a funciones del SDK de Android dentro del Presentador.</td>
            </tr>
        </tbody>
    </table>
</div>';
insertSubtopic($conn, 3, '3.5 Análisis de Costos y Evaluación', $content_3_5);


// ======================================================================================
// TEMA 4: MVVM
// ======================================================================================
insertTopic($conn, 4, 'Arquitectura MVVM (Model–View–ViewModel)', 'El estándar moderno. Programación reactiva, Data Binding y ciclos de vida conscientes.');

$content_4_1 = '
<div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
    <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición de MVVM</h4>
    <p><strong>MVVM (Model-View-ViewModel)</strong> es la arquitectura recomendada oficialmente por Google (Android Jetpack) y Apple (SwiftUI) para el desarrollo moderno. Su diferenciador clave frente a MVP es el uso de <strong>Data Binding</strong> y la <strong>Programación Reactiva</strong>.</p>
</div>
<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/4.1.jpeg" alt="MVVM Definition" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
</div>
<p>A diferencia de MVP, donde el Presentador le dice imperativamente a la Vista qué hacer (`view.showLoading()`), en MVVM la Vista "observa" pasivamente los cambios en el ViewModel. El ViewModel no sabe quién lo está observando. Cuando el Modelo actualiza los datos, el ViewModel emite el nuevo valor y la Vista reacciona automáticamente actualizándose a sí misma. Esto invierte el flujo de control y elimina gran parte del código "pegamento" propenso a errores.</p>';
insertSubtopic($conn, 4, '4.1 Definición de MVVM', $content_4_1);

$content_4_2 = '
<p>MVVM se compone de tres piezas fundamentales que interactúan de forma desacoplada y reactiva:</p>
<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/4.2.jpg" alt="MVVM Components" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
</div>
<div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 Model (Modelo)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Capa de datos y lógica de negocio. Contiene el acceso a bases de datos (Room/CoreData), servicios de red (Retrofit/Alamofire) y repositorios. Es completamente ignorante de la UI y del ViewModel. Su responsabilidad es proveer datos correctos.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 ViewModel (Modelo de Vista)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Es el intermediario inteligente y el gestor del estado de la UI. Prepara y transforma los datos del Modelo para que sean consumibles por la Vista.
        <br>1. <strong>Sobrevive a la configuración:</strong> No se destruye al rotar la pantalla.
        <br>2. <strong>No conoce a la Vista:</strong> No tiene referencias a `Activity` o `View` (evita Memory Leaks).
        <br>3. <strong>Expone Observables:</strong> Ofrece flujos de datos (LiveData, StateFlow) que la vista puede observar.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 View (Vista)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Totalmente reactiva. Su única responsabilidad es definir la estructura visual y suscribirse a los eventos del ViewModel. En Android puede ser XML con Data Binding o código Jetpack Compose; en iOS es SwiftUI. Cuando el dato cambia, la vista se redibuja sola.</p>
    </div>
</div>';
insertSubtopic($conn, 4, '4.2 Componentes MVVM Detallados', $content_4_2);

$content_4_3 = '
<h4 style="color: var(--accent-purple); margin-bottom: 1rem;">La Magia del Data Binding</h4>
<p>El Data Binding es el mecanismo que conecta automáticamente las propiedades de la UI con los datos del ViewModel, eliminando el código repetitivo de actualización manual (`findViewById`, `setText`, etc.).</p>
<ul style="margin-left: 20px; color: #ccc; margin-bottom: 1.5rem;">
    <li><strong>Binding Unidireccional (@{user.name}):</strong> El flujo va del ViewModel a la Vista. Si el nombre cambia en la base de datos, el TextView se actualiza solo.</li>
    <li><strong>Binding Bidireccional (@={user.name}):</strong> El flujo va en ambos sentidos. Si el usuario escribe en un campo de texto, la variable en el ViewModel se actualiza automáticamente, facilitando la validación de formularios.</li>
</ul>
<div style="background: #111; padding: 1rem; border-radius: 6px; border: 1px solid #333; font-family: monospace; color: #aaa;">
    <span style="color: #888;">// Ejemplo conceptual (Kotlin/Compose)</span><br>
    <span style="color: #c678dd;">val</span> userName <span style="color: #56b6c2;">by</span> viewModel.userName.observeAsState()<br>
    <span style="color: #e06c75;">Text</span>(text = userName) <span style="color: #888;">// Se redibuja automáticamente solo cuando userName cambia</span>
</div>';
insertSubtopic($conn, 4, '4.3 Data Binding y Observabilidad', $content_4_3);

$content_4_4 = '
<p>Implementar MVVM requiere seguir un flujo estricto para mantener la integridad de la arquitectura:</p>
<ol style="margin-left: 1.5rem; color: #e0e0e0; margin-top: 1rem;">
    <li style="margin-bottom: 0.5rem;"><strong>Definir el Modelo:</strong> Crear las entidades de datos, DAOs y Repositorios.</li>
    <li style="margin-bottom: 0.5rem;"><strong>Crear el ViewModel:</strong> Inyectar el repositorio en el constructor. Exponer objetos `LiveData` o `StateFlow` públicos (inmutables) para cada elemento de la UI que necesite datos dinámicos.</li>
    <li style="margin-bottom: 0.5rem;"><strong>Diseñar la Vista:</strong> Crear el layout XML o la función Composable.</li>
    <li style="margin-bottom: 0.5rem;"><strong>Suscribir:</strong> En el método `onCreate` de la Activity/Fragment, observar los LiveData del ViewModel. Definir la lógica de "qué hacer" cuando el dato cambia (actualizar UI).</li>
    <li style="margin-bottom: 0.5rem;"><strong>Manejar Eventos:</strong> Los clics en la Vista no ejecutan lógica; simplemente llaman a funciones semánticas del ViewModel (`viewModel.onLoginClicked()`).</li>
</ol>';
insertSubtopic($conn, 4, '4.4 Flujo de Implementación', $content_4_4);

$content_4_5 = '
<p>Tabla detallada de evaluación para la arquitectura MVVM.</p>
<div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
    <table style="width: 100%; border-collapse: collapse; min-width: 900px; font-size: 0.95rem;">
        <thead>
            <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Ventaja (Por qué y Cuándo)</th>
                <th style="padding: 15px; text-align: left; width: 40%;">❌ Desventaja (Por qué y Cuándo)</th>
            </tr>
        </thead>
        <tbody>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Productividad y Velocidad</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;"><strong>Muy alta.</strong> El Data Binding elimina miles de líneas de código repetitivo de actualización de UI. Menos código significa menos bugs superficiales y desarrollo más rápido de pantallas complejas.</td>
                <td style="padding: 15px; color: #ccc;">Curva de aprendizaje inicial alta. Requiere que el equipo domine conceptos complejos como Observables, LiveData, StateFlow, Corrutinas/Combine y Ciclos de Vida.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">El ViewModel es extremadamente fácil de testear unitariamente ya que no tiene referencias a la Vista ni al SDK de Android. Se pueden simular flujos de datos complejos.</td>
                <td style="padding: 15px; color: #ccc;">Testear el Data Binding en sí mismo es difícil o imposible. Si se incluye lógica de negocio dentro del XML (mala práctica común), esa lógica queda fuera de las pruebas.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Excelente. El desacoplamiento total permite cambiar la UI (ej: de XML a Compose) manteniendo el mismo ViewModel y lógica de negocio intactos.</td>
                <td style="padding: 15px; color: #ccc;">En aplicaciones gigantes, los ViewModels pueden volverse muy grandes y complejos si no se dividen adecuadamente o si asumen demasiadas responsabilidades.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Debugging</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Buena separación lógica que ayuda a localizar errores de negocio.</td>
                <td style="padding: 15px; color: #ccc;">A veces el Data Binding es "mágico". Si algo falla en la conexión XML-ViewModel, el error puede ser críptico, silencioso y muy difícil de rastrear.</td>
            </tr>
        </tbody>
    </table>
</div>';
insertSubtopic($conn, 4, '4.5 Análisis de Costos y Evaluación', $content_4_5);


// ======================================================================================
// TEMA 5: MVI
// ======================================================================================
insertTopic($conn, 5, 'Arquitectura MVI (Model–View–Intent)', 'El enfoque funcional y reactivo. Estados inmutables y flujos unidireccionales para máxima previsibilidad.');

$content_5_1 = '
<div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
    <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición de MVI</h4>
    <p><strong>MVI (Model-View-Intent)</strong> es un patrón arquitectónico que trata la interfaz de usuario como una máquina de estados finitos. Inspirado en Redux (Web) y Cycle.js, propone un flujo de datos <strong>estrictamente unidireccional y cíclico</strong>.</p>
</div>
<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/5.1.jpg" alt="MVI Definition" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
</div>
<p>La regla de oro inquebrantable de MVI es: <strong>El estado es inmutable.</strong> Nunca modificas un campo de un objeto de estado existente; en su lugar, creas un nuevo objeto de estado completo para cada cambio, por mínimo que sea. Esto permite tener un historial perfecto de todo lo que ha ocurrido en la aplicación, habilitando características avanzadas de depuración y asegurando que la UI siempre sea un reflejo exacto del último estado conocido.</p>';
insertSubtopic($conn, 5, '5.1 Definición de MVI', $content_5_1);

$content_5_2 = '
<p>MVI redefine los componentes tradicionales con un enfoque funcional:</p>
<ul style="margin-left: 20px; color: #ccc; margin-bottom: 1.5rem;">
    <li style="margin-bottom: 1rem;"><strong>Model (Estado):</strong> No se refiere solo a la capa de base de datos, sino al <em>Estado Único de la Verdad</em> de la UI. Es un objeto inmutable (Data Class) que contiene TODO lo necesario para pintar la pantalla en un instante dado (ej: `{ isLoading: true, userList: [], error: null }`).</li>
    <li style="margin-bottom: 1rem;"><strong>View (Vista):</strong> Se comporta como una función matemática pura `f(Model) -> UI`. Cada vez que recibe un nuevo objeto Modelo, se "repinta" (conceptualmente) para reflejarlo. No mantiene estado interno propio.</li>
    <li style="margin-bottom: 1rem;"><strong>Intent (Intención):</strong> Representa la <em>intención</em> del usuario de realizar una acción. No debe confundirse con el `android.content.Intent`. Es un evento semántico como `LoadUserIntent`, `SubmitLoginIntent` o `TypeSearchTermIntent`.</li>
</ul>';
insertSubtopic($conn, 5, '5.2 Componentes de MVI', $content_5_2);

$content_5_3 = '
<div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
    <h4 style="color: var(--accent-purple); margin-bottom: 1rem;">🔄 Ciclo Unidireccional (UDF)</h4>
    <p style="margin-bottom: 1rem;">El dato viaja en una sola dirección en un ciclo cerrado, eliminando efectos secundarios inesperados y condiciones de carrera:</p>
    <ol style="margin-left: 1.5rem; color: #e0e0e0;">
        <li style="margin-bottom: 1rem;"><strong>User Event:</strong> El usuario interactúa (hace clic en un botón).</li>
        <li style="margin-bottom: 1rem;"><strong>Intent:</strong> La vista traduce esa interacción en un `Intent` y lo envía al procesador central (ViewModel/Store).</li>
        <li style="margin-bottom: 1rem;"><strong>Reducer/Processor:</strong> Una función pura toma el <em>Estado Actual</em> + <em>Intención</em> y calcula matemáticamente el <em>Estado Nuevo</em>. No muta nada, crea algo nuevo.</li>
        <li style="margin-bottom: 1rem;"><strong>State Emission:</strong> El nuevo estado inmutable se emite por el canal de eventos.</li>
        <li style="margin-bottom: 1rem;"><strong>Render:</strong> La Vista recibe el nuevo estado y se actualiza para reflejarlo.</li>
    </ol>
</div>';
insertSubtopic($conn, 5, '5.3 Flujo Unidireccional Detallado', $content_5_3);

$content_5_4 = '
<h4 style="color: var(--accent-blue);">La importancia crítica de la Inmutabilidad</h4>
<p>En arquitecturas como MVVM, a menudo tenemos múltiples variables observables (`isLoading`, `userList`, `errorText`). Esto puede llevar a estados inconsistentes imposibles (ej: `isLoading=false`, pero `errorText` vacío y `userList` vacío... ¿qué pasó? ¿se cargó? ¿hubo error?).</p>
<p>En MVI, hay <strong>UN solo objeto de estado</strong> que agrupa todo. No puedes tener un estado inválido si diseñas bien tu modelo (ej: usando Sealed Classes en Kotlin como `State.Loading`, `State.Success`, `State.Error`). El estado representa una "foto" exacta y validada de la UI en un momento dado. Esto hace que los bugs de sincronización de estado (loading spinners que no desaparecen, datos mezclados) desaparezcan por completo.</p>';
insertSubtopic($conn, 5, '5.4 Gestión de Estado e Inmutabilidad', $content_5_4);

$content_5_5 = '
<p>Tabla detallada de evaluación para la arquitectura MVI.</p>
<div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
    <table style="width: 100%; border-collapse: collapse; min-width: 900px; font-size: 0.95rem;">
        <thead>
            <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Ventaja (Por qué y Cuándo)</th>
                <th style="padding: 15px; text-align: left; width: 40%;">❌ Desventaja (Por qué y Cuándo)</th>
            </tr>
        </thead>
        <tbody>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Consistencia y Predecibilidad</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;"><strong>Total.</strong> Es imposible tener estados inconsistentes. La aplicación se comporta de manera determinista. Si ocurre un error, es fácil de reproducir con el historial de estados.</td>
                <td style="padding: 15px; color: #ccc;">Rigidez. Cambios simples pueden requerir actualizar múltiples partes del flujo (Intent, State, Reducer).</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Debugging</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Superior a cualquier otra arquitectura. Los logs muestran claramente: "Llegó Intento X -> Estado cambió de A a B". Permite "Time Travel Debugging".</td>
                <td style="padding: 15px; color: #ccc;">Puede ser abrumador leer logs gigantes de objetos de estado complejos si no se tienen herramientas adecuadas.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Excelente. Los Reducers son funciones puras (Entrada -> Salida) sin efectos secundarios, lo que los hace triviales de probar unitariamente.</td>
                <td style="padding: 15px; color: #ccc;">Requiere escribir muchos tests para cubrir todas las combinaciones posibles de estados.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Rendimiento (Performance)</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Bueno en la mayoría de los casos modernos.</td>
                <td style="padding: 15px; color: #ccc;"><strong>Gestión de Memoria.</strong> Crear un nuevo objeto de estado por cada pequeña interacción (ej: teclear un carácter en un buscador) puede causar presión excesiva en el Garbage Collector (GC) y lag si no se optimiza con `distinctUntilChanged`.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Curva de Aprendizaje</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Baja para desarrolladores familiarizados con Redux o React.</td>
                <td style="padding: 15px; color: #ccc;"><strong>Muy Alta (Bloqueante).</strong> Requiere un cambio mental total hacia la programación funcional y reactiva. Muy difícil para equipos acostumbrados a programación imperativa tradicional.</td>
            </tr>
        </tbody>
    </table>
</div>';
insertSubtopic($conn, 5, '5.5 Análisis de Costos y Evaluación', $content_5_5);


// ======================================================================================
// TEMA 6: CLEAN ARCHITECTURE
// ======================================================================================
insertTopic($conn, 6, 'Clean Architecture en Aplicaciones Móviles', 'Organización en capas concéntricas para la independencia total.');

$content_6_1 = '
<div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
    <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición de Clean Architecture</h4>
    <p>Clean Architecture es un enfoque arquitectónico propuesto por Robert C. Martin (Uncle Bob) que organiza el software en capas concéntricas. A diferencia de patrones de interfaz de usuario como MVC o MVVM (que se enfocan en cómo mostrar datos), Clean Architecture abarca <strong>toda la estructura de la aplicación</strong>, desde la base de datos hasta la interfaz de usuario, pasando por la lógica de negocio.</p>
</div>
<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/6.1.jpg" alt="Clean Architecture Definition" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
</div>
<p>Su objetivo fundamental es la <strong>Separación de Intereses (Separation of Concerns)</strong> para crear sistemas que sean:</p>
<ul style="margin-left: 20px; color: #ccc; margin-bottom: 1rem;">
    <li><strong>Independientes de Frameworks:</strong> La arquitectura no depende de la existencia de una librería cargada de características. Esto te permite usar frameworks como herramientas, en lugar de encajonar tu sistema en sus limitaciones.</li>
    <li><strong>Testables:</strong> Las reglas de negocio se pueden probar sin la UI, base de datos, servidor web, o cualquier otro elemento externo.</li>
    <li><strong>Independientes de la UI:</strong> La interfaz de usuario puede cambiar fácilmente sin cambiar el resto del sistema. Una UI web podría ser reemplazada por una UI de consola, sin cambiar las reglas de negocio.</li>
    <li><strong>Independientes de la Base de Datos:</strong> Puedes cambiar Oracle o SQL Server por Mongo, BigTable, CouchDB, o cualquier otra cosa. Tus reglas de negocio no están atadas a la base de datos.</li>
</ul>';
insertSubtopic($conn, 6, '6.1 Definición de Clean Architecture', $content_6_1);

$content_6_2 = '
<h4 style="color: var(--accent-purple); margin-bottom: 1rem;">La Regla de Dependencia (El Principio Fundamental)</h4>
<p>La regla que gobierna todo este movimiento es simple pero estricta: <strong>Las dependencias de código fuente solo pueden apuntar hacia adentro</strong>.</p>
<div style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; border: 1px solid #333;">
    <p>Nada en un círculo interno puede saber absolutamente nada sobre algo en un círculo externo. Esto incluye funciones, clases, variables o cualquier otra entidad de software nombrada.</p>
    <ul style="margin-left: 20px; color: #ccc; margin-top: 1rem;">
        <li>Por ejemplo, la capa de Dominio (Círculo más interno) <strong>NO</strong> puede tener una clase que importe `android.os.Bundle` o `java.sql.SQLException`.</li>
        <li>Los formatos de datos usados en un círculo externo no deben ser usados por un círculo interno. No queremos que la estructura de la base de datos o el JSON de la API dicte cómo funciona nuestra lógica de negocio.</li>
    </ul>
</div>
<p style="margin-top: 1rem;">Esta regla es la que garantiza que si mañana Google decide deprecar una librería de Android, o si decides cambiar de base de datos SQL a Realm, tu lógica de negocio (el corazón de tu app) permanezca intacta y segura.</p>';
insertSubtopic($conn, 6, '6.2 La Regla de Dependencia', $content_6_2);

$content_6_3 = '
<h4 style="color: var(--accent-blue); margin-bottom: 1rem;">Capas y Estructura (De adentro hacia afuera)</h4>
<p>Clean Architecture se visualiza comúnmente como una serie de anillos concéntricos:</p>
<div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #ffcc00;">
        <h4 style="color: #ffcc00; margin-bottom: 0.5rem;">1. Entidades (Amarillo - Centro)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Objetos de negocio puros. Encapsulan las <strong>Reglas de Negocio de la Empresa</strong> más generales y de alto nivel. Son las menos propensas a cambiar ante cambios externos (como cambios en la navegación o seguridad). Ejemplo: Una entidad `Prestamo` que calcula su propio interés.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #ff6666;">
        <h4 style="color: #ff6666; margin-bottom: 0.5rem;">2. Casos de Uso (Rojo)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Contienen las <strong>Reglas de Negocio de la Aplicación</strong>. Orquestan el flujo de datos hacia y desde las entidades. Dirigen a las entidades para que usen su lógica para lograr los objetivos del caso de uso. Ejemplo: `SolicitarPrestamoUseCase`.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #66cc66;">
        <h4 style="color: #66cc66; margin-bottom: 0.5rem;">3. Adaptadores de Interfaz (Verde)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Convierten datos del formato más conveniente para los casos de uso y entidades, al formato más conveniente para algún agente externo como la Base de Datos o la Web. Aquí viven los Presenters, ViewModels y Controladores.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #3399ff;">
        <h4 style="color: #3399ff; margin-bottom: 0.5rem;">4. Frameworks y Drivers (Azul - Externo)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Donde van todos los detalles: La UI, la Base de Datos, el Framework Web, Dispositivos, etc. Aquí es donde escribes código específico de Android o iOS. Es la capa más volátil y sucia.</p>
    </div>
</div>';
insertSubtopic($conn, 6, '6.3 Capas y Estructura', $content_6_3);

$content_6_4 = '
<h4 style="color: var(--accent-purple); margin-bottom: 1rem;">Cruzando las fronteras (Inversión de Control)</h4>
<p>Una pregunta común es: <em>"¿Cómo puede un Caso de Uso (interno) llamar a un Presenter o guardar datos en una Base de Datos (externos) si la Regla de Dependencia prohíbe mirar hacia afuera?"</em></p>
<div style="background: rgba(255,255,255,0.05); padding: 1.5rem; border-radius: 8px; border-left: 4px solid var(--accent-blue);">
    <h5 style="color: #fff; margin-bottom: 0.5rem;">La Respuesta: El Principio de Inversión de Dependencias (DIP)</h5>
    <p>En lugar de llamar directamente a la clase concreta de la capa externa, el código interno define una <strong>Interfaz</strong> (un contrato) dentro de su propia capa.</p>
    <ul style="margin-left: 20px; color: #ccc; margin-top: 0.5rem;">
        <li><strong>Paso 1:</strong> El Caso de Uso define una interfaz `UserRepository` con un método `save(User)`. Esta interfaz vive en la capa de Dominio (Adentro).</li>
        <li><strong>Paso 2:</strong> La capa de Datos (Afuera) implementa esa interfaz con una clase `UserRepositoryImpl` que usa SQL o Retrofit.</li>
        <li><strong>Resultado:</strong> En tiempo de compilación, la capa externa depende de la interna (para implementar la interfaz). En tiempo de ejecución, el flujo de control viaja hacia afuera (para guardar el dato), pero la dependencia de código se mantiene apuntando hacia adentro.</li>
    </ul>
</div>
<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/6.4.jpg" alt="Clean Architecture Inversion of Control" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
</div>
<p style="margin-top: 1rem;">Esto es lo que permite que Clean Architecture sea "plug-in". Puedes "enchufar" diferentes implementaciones de base de datos o UI sin que el núcleo del sistema se entere.</p>';
insertSubtopic($conn, 6, '6.4 Cruzando Fronteras (Inversión de Control)', $content_6_4);

$content_6_5 = '
<p>Tabla detallada de evaluación para Clean Architecture.</p>
<div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
    <table style="width: 100%; border-collapse: collapse; min-width: 900px; font-size: 0.95rem;">
        <thead>
            <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Ventaja (Por qué y Cuándo)</th>
                <th style="padding: 15px; text-align: left; width: 40%;">❌ Desventaja (Por qué y Cuándo)</th>
            </tr>
        </thead>
        <tbody>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial de implementación</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Permite una estructura altamente organizada desde el inicio, reduciendo errores futuros y facilitando el crecimiento del sistema.</td>
                <td style="padding: 15px; color: #ccc;"><strong>Alto costo inicial.</strong> Requiere mucho tiempo de diseño, planificación y creación de estructura (scaffolding) debido a la gran cantidad de capas y abstracciones.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Infraestructura y herramientas</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Independiente de frameworks o tecnologías. Permite cambiar librerías (ej: Gson a Moshi) sin afectar la lógica principal.</td>
                <td style="padding: 15px; color: #ccc;">Requiere mayor configuración del proyecto, gestión de dependencias compleja (Gradle multi-módulo) y conocimiento avanzado del equipo.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Disminuye drásticamente el retrabajo en proyectos grandes gracias a la clara separación entre capas (dominio, datos y presentación).</td>
                <td style="padding: 15px; color: #ccc;">Desarrollo inicial más lento. Para una funcionalidad simple se deben tocar múltiples archivos (Entity, UseCase, Repository Interface, Repository Impl, DTO, Mapper, ViewModel).</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;"><strong>Muy alta.</strong> Ideal para aplicaciones empresariales o proyectos de larga duración (+5 años). Soporta equipos grandes sin conflictos.</td>
                <td style="padding: 15px; color: #ccc;">Puede resultar una sobreingeniería excesiva y absurda para aplicaciones pequeñas, prototipos rápidos o apps con vida útil corta.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento a largo plazo</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;"><strong>Gran ventaja.</strong> El código no "envejece" tanto porque el núcleo está protegido. Facilita modificaciones y actualizaciones tecnológicas.</td>
                <td style="padding: 15px; color: #ccc;">La complejidad estructural puede dificultar la comprensión y navegación del código para desarrolladores nuevos o sin experiencia en el patrón.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Excelente soporte para pruebas unitarias al aislar completamente la lógica de negocio en clases puras Java/Kotlin.</td>
                <td style="padding: 15px; color: #ccc;">Configurar el entorno de pruebas e inyección de dependencias puede requerir mayor preparación técnica inicial.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Comparación con MVC, MVP, MVVM</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Mejor separación de responsabilidades y menor dependencia tecnológica que cualquiera de los anteriores, aumentando la estabilidad.</td>
                <td style="padding: 15px; color: #ccc;">Mucho más compleja y costosa de implementar que MVC, MVP o MVVM. No es un reemplazo directo, sino una estructura que envuelve a estos patrones de UI.</td>
            </tr>
        </tbody>
    </table>
</div>';
insertSubtopic($conn, 6, '6.5 Ventajas y Desventajas', $content_6_5);


// ======================================================================================
// TEMA 7: LAYERED
// ======================================================================================
insertTopic($conn, 7, 'Arquitectura en capas (Layered Architecture)', 'Organización jerárquica tradicional. Separación lógica por niveles de responsabilidad.');

$content_7_1 = '
<div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
    <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición Clásica</h4>
    <p><strong>Layered Architecture</strong> (Arquitectura en Capas) es el estilo arquitectónico más común, intuitivo y tradicional en el desarrollo de software. Organiza el código en capas horizontales apiladas una sobre otra, donde cada capa tiene un rol específico y solo puede comunicarse con las capas adyacentes.</p>
</div>
<p>Es el punto de partida estándar para la mayoría de aplicaciones empresariales monolíticas antes de evolucionar a arquitecturas más complejas como Hexagonal o Clean. Su principio es la <strong>Separación de Intereses (Separation of Concerns)</strong> basada en la abstracción técnica (UI, Lógica, Datos).</p>';
insertSubtopic($conn, 7, '7.1 Definición de Arquitectura en Capas', $content_7_1);

$content_7_2 = '
<p>Típicamente se divide en 3 o 4 capas estándar que forman una jerarquía estricta:</p>
<ul style="margin-left: 20px; color: #ccc; margin-bottom: 1.5rem;">
    <li style="margin-bottom: 1rem;"><strong>Presentation Layer (UI):</strong> La capa superior. Maneja la interacción con el usuario y presenta la información. Solo habla con la capa de Dominio/Negocio. No accede a la base de datos directamente.</li>
    <li style="margin-bottom: 1rem;"><strong>Domain/Business Layer:</strong> Contiene la lógica de negocio. Es el corazón de la funcionalidad. Procesa comandos de la UI, aplica reglas y consulta datos a la capa de Persistencia.</li>
    <li style="margin-bottom: 1rem;"><strong>Persistence/Data Layer:</strong> Se encarga de guardar y recuperar datos (SQL, Archivos, APIs). Abstrae los detalles técnicos del almacenamiento para que el negocio no se preocupe por SQL.</li>
    <li style="margin-bottom: 1rem;"><strong>Database Layer:</strong> La base de datos física o el servicio externo real subyacente.</li>
</ul>';
insertSubtopic($conn, 7, '7.2 Capas Típicas', $content_7_2);

$content_7_3 = '
<h4 style="color: var(--accent-purple); margin-bottom: 1rem;">Patrones de Interacción</h4>
<p>Existen dos variantes principales en cómo las capas se comunican entre sí:</p>
<ul style="margin-left: 20px; color: #ccc;">
    <li><strong>Capas Cerradas (Closed Layers - Strict):</strong> Una capa solo puede llamar a la inmediatamente inferior. Esto reduce el acoplamiento al máximo, pero puede generar "Proxy Methods" innecesarios que solo pasan datos sin hacer nada (Sinkhole Anti-pattern).</li>
    <li><strong>Capas Abiertas (Open Layers - Relaxed):</strong> Una capa puede saltarse a la intermedia y llamar a una capa inferior (ej: UI llamando a Persistencia para leer datos de solo lectura). Mejora el rendimiento y reduce código, pero aumenta peligrosamente el acoplamiento y el riesgo de "Spaghetti Code".</li>
</ul>';
insertSubtopic($conn, 7, '7.3 Interacción entre Capas', $content_7_3);

$content_7_4 = '
<p>Tabla detallada de evaluación para la Arquitectura en Capas.</p>
<div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
    <table style="width: 100%; border-collapse: collapse; min-width: 900px; font-size: 0.95rem;">
        <thead>
            <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Ventaja (Por qué y Cuándo)</th>
                <th style="padding: 15px; text-align: left; width: 40%;">❌ Desventaja (Por qué y Cuándo)</th>
            </tr>
        </thead>
        <tbody>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial y Facilidad</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;"><strong>Muy Bajo.</strong> Es muy fácil de entender, configurar e iniciar. Es el "estándar mental" de la mayoría de desarrolladores. Ideal para empezar rápido.</td>
                <td style="padding: 15px; color: #ccc;">Tiende a degenerar en una "Gran Bola de Lodo" (Big Ball of Mud) si no se respetan los límites estrictamente, ya que no hay reglas físicas que impidan saltar capas.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Despliegue y Modificación</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Sencillo en apps monolíticas pequeñas.</td>
                <td style="padding: 15px; color: #ccc;">Un cambio simple en la base de datos (ej: añadir un campo a una tabla) a menudo requiere cambios en cascada en TODAS las capas superiores (DTOs, Dominio, UI), rompiendo la encapsulación y aumentando el riesgo de errores.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Bueno si se usan interfaces entre capas.</td>
                <td style="padding: 15px; color: #ccc;">Si las capas están acopladas directamente (clases concretas instanciando clases concretas), es muy difícil de probar unitariamente sin levantar todo el sistema.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Media. Funciona para aplicaciones de negocio estándar.</td>
                <td style="padding: 15px; color: #ccc;">Mala para alta concurrencia o sistemas distribuidos. Tiende a crear "cuellos de botella" en capas específicas.</td>
            </tr>
        </tbody>
    </table>
</div>';
insertSubtopic($conn, 7, '7.4 Análisis de Costos y Evaluación', $content_7_4);


// ======================================================================================
// TEMA 8: COMPARACIÓN
// ======================================================================================
insertTopic($conn, 8, 'Comparación de arquitecturas móviles', 'Análisis final, gráficos comparativos y guía de decisión estratégica.');

$content_8_1 = '
<div class="charts-container" style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin-top: 2rem;">
    <div class="chart-box" style="background: #111; padding: 1rem; border-radius: 12px; border: 1px solid #333;">
        <h4 style="text-align: center; margin-bottom: 1rem;">Nivel de Testabilidad</h4>
        <canvas id="testabilityChart"></canvas>
    </div>
    <div class="chart-box" style="background: #111; padding: 1rem; border-radius: 12px; border: 1px solid #333;">
        <h4 style="text-align: center; margin-bottom: 1rem;">Curva de Aprendizaje</h4>
        <canvas id="complexityChart"></canvas>
    </div>
</div>
<div class="chart-box" style="background: #111; padding: 1rem; border-radius: 12px; border: 1px solid #333; margin-top: 2rem;">
    <h4 style="text-align: center; margin-bottom: 1rem;">Comparativa General (Radar)</h4>
    <div style="max-width: 600px; margin: 0 auto;">
        <canvas id="radarChart"></canvas>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        Chart.defaults.color = "#ccc";
        Chart.defaults.borderColor = "#333";
        new Chart(document.getElementById("testabilityChart"), {
            type: "bar",
            data: {
                labels: ["MVC", "MVP", "MVVM", "MVI", "Clean Arch"],
                datasets: [{
                    label: "Nivel de Testabilidad (1-10)",
                    data: [3, 8, 9, 9.5, 10],
                    backgroundColor: ["rgba(255, 99, 132, 0.6)", "rgba(54, 162, 235, 0.6)", "rgba(255, 206, 86, 0.6)", "rgba(75, 192, 192, 0.6)", "rgba(153, 102, 255, 0.6)"],
                    borderColor: ["rgba(255, 99, 132, 1)", "rgba(54, 162, 235, 1)", "rgba(255, 206, 86, 1)", "rgba(75, 192, 192, 1)", "rgba(153, 102, 255, 1)"],
                    borderWidth: 1
                }]
            },
            options: { scales: { y: { beginAtZero: true, max: 10 } } }
        });
        new Chart(document.getElementById("complexityChart"), {
            type: "doughnut",
            data: {
                labels: ["MVC (Baja)", "MVP (Media)", "MVVM (Media-Alta)", "MVI (Alta)", "Clean Arch (Muy Alta)"],
                datasets: [{
                    data: [20, 40, 60, 80, 100],
                    backgroundColor: ["#4ade80", "#60a5fa", "#facc15", "#f472b6", "#a78bfa"],
                    hoverOffset: 20
                }]
            },
            options: { cutout: "60%" }
        });
        new Chart(document.getElementById("radarChart"), {
            type: "radar",
            data: {
                labels: ["Escalabilidad", "Mantenibilidad", "Testabilidad", "Facilidad Inicio", "Performance UI"],
                datasets: [
                    { label: "MVC", data: [3, 3, 3, 9, 7], fill: true, backgroundColor: "rgba(255, 99, 132, 0.2)", borderColor: "rgb(255, 99, 132)", pointBackgroundColor: "rgb(255, 99, 132)" },
                    { label: "MVVM", data: [8, 8, 9, 6, 9], fill: true, backgroundColor: "rgba(54, 162, 235, 0.2)", borderColor: "rgb(54, 162, 235)", pointBackgroundColor: "rgb(54, 162, 235)" },
                    { label: "MVI", data: [9, 9, 9, 4, 8], fill: true, backgroundColor: "rgba(75, 192, 192, 0.2)", borderColor: "rgb(75, 192, 192)", pointBackgroundColor: "rgb(75, 192, 192)" }
                ]
            },
            options: { elements: { line: { borderWidth: 3 } }, scales: { r: { min: 0, max: 10, ticks: { display: false }, grid: { color: "#444" } } } }
        });
    });
</script>';
insertSubtopic($conn, 8, '8.1 Comparativa Visual e Interactiva', $content_8_1);

$content_8_2 = '
<h4 style="color: var(--accent-purple); margin-bottom: 1rem;">Escenarios del Mundo Real: ¿Qué elegir?</h4>
<div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 1rem;">
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-left: 4px solid #4ade80;">
        <h5 style="color: #fff; margin-bottom: 0.5rem;">Startup / MVP (Producto Mínimo Viable)</h5>
        <p style="font-size: 0.9rem; color: #ccc;"><strong>Elección: MVC o MVVM Simple.</strong></p>
        <p style="font-size: 0.9rem; color: #aaa;">Necesitas velocidad. No pierdas tiempo configurando inyección de dependencias compleja o capas abstractas. Un MVC bien organizado o un MVVM básico (sin Clean Arch) es suficiente para validar tu idea en el mercado.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-left: 4px solid #60a5fa;">
        <h5 style="color: #fff; margin-bottom: 0.5rem;">App Bancaria / Fintech</h5>
        <p style="font-size: 0.9rem; color: #ccc;"><strong>Elección: Clean Architecture + MVI.</strong></p>
        <p style="font-size: 0.9rem; color: #aaa;">La seguridad y la consistencia de los datos son críticas. MVI asegura que no haya estados inválidos en la UI (ej: mostrar saldo mientras carga). Clean Architecture protege la lógica financiera de cambios en la UI.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-left: 4px solid #facc15;">
        <h5 style="color: #fff; margin-bottom: 0.5rem;">App de Noticias / Blog</h5>
        <p style="font-size: 0.9rem; color: #ccc;"><strong>Elección: MVVM + Repository.</strong></p>
        <p style="font-size: 0.9rem; color: #aaa;">El contenido es principalmente lectura. MVVM con Data Binding facilita mostrar listas y detalles. El patrón Repository maneja el caché offline (Room/Realm) de forma transparente para el usuario.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-left: 4px solid #f472b6;">
        <h5 style="color: #fff; margin-bottom: 0.5rem;">App Legacy (Código Antiguo)</h5>
        <p style="font-size: 0.9rem; color: #ccc;"><strong>Elección: Refactorización progresiva a MVP/MVVM.</strong></p>
        <p style="font-size: 0.9rem; color: #aaa;">Si tienes "God Activities" en MVC, empieza extrayendo la lógica a Presenters (MVP) para poder testearla. No intentes reescribir todo a Clean Architecture de golpe o paralizarás el negocio.</p>
    </div>
</div>';
insertSubtopic($conn, 8, '8.2 Escenarios del Mundo Real', $content_8_2);

$content_8_3 = '
<h4 style="color: var(--accent-blue); margin-bottom: 1rem;">Ejemplos Prácticos de Implementación</h4>
<p>Comparativa de código para una misma tarea: <strong>Mostrar un mensaje de "Hola Mundo" al hacer clic en un botón.</strong></p>

<div style="margin-top: 2rem;">
    <h5 style="color: #4ade80;">1. MVC (Android)</h5>
    <pre style="background:#111; color:#ccc; padding:1rem; border-radius:6px; font-size:0.8rem;">
// Activity actúa como Controller y conoce a la View
button.setOnClickListener {
    textView.text = "Hola Mundo" // Modificación directa de la View
}
    </pre>
</div>

<div style="margin-top: 2rem;">
    <h5 style="color: #60a5fa;">2. MVP</h5>
    <pre style="background:#111; color:#ccc; padding:1rem; border-radius:6px; font-size:0.8rem;">
// Presenter (Lógica pura, sin Android SDK)
fun onButtonClick() {
    view.showText("Hola Mundo") // Llama a interfaz
}

// Activity (Implementa View)
override fun showText(text: String) {
    textView.text = text
}
    </pre>
</div>

<div style="margin-top: 2rem;">
    <h5 style="color: #facc15;">3. MVVM</h5>
    <pre style="background:#111; color:#ccc; padding:1rem; border-radius:6px; font-size:0.8rem;">
// ViewModel
val text = MutableLiveData<String>()
fun onButtonClick() {
    text.value = "Hola Mundo" // Emite estado
}

// Activity
viewModel.text.observe(this) { newText ->
    textView.text = newText // Reacciona al cambio
}
    </pre>
</div>

<div style="margin-top: 2rem;">
    <h5 style="color: #f472b6;">4. MVI</h5>
    <pre style="background:#111; color:#ccc; padding:1rem; border-radius:6px; font-size:0.8rem;">
// Intent
data class UserClickedButton(val time: Long) : Intent

// Reducer
fun reduce(state: State, intent: Intent): State {
    return when(intent) {
        is UserClickedButton -> state.copy(text = "Hola Mundo")
    }
}
    </pre>
</div>';
insertSubtopic($conn, 8, '8.3 Ejemplos Prácticos de cada Modelo', $content_8_3);

$content_8_4 = '
<h4 style="color: var(--accent-blue); margin-bottom: 1rem;">Matriz de Decisión Estratégica</h4>
<p>Utiliza esta guía rápida para tomar decisiones arquitectónicas basadas en las características de tu equipo y proyecto:</p>
<ul style="list-style: none; padding: 0;">
    <li style="margin-bottom: 1rem; padding: 1rem; background: rgba(255,255,255,0.03); border-radius: 6px;">
        <strong style="color: var(--accent-purple);">¿El equipo es Junior o tiene poca experiencia móvil?</strong>
        <br><span style="color: #aaa;">👉 Evita Clean Architecture y MVI. Empieza con MVVM estándar usando las guías oficiales de Google/Apple.</span>
    </li>
    <li style="margin-bottom: 1rem; padding: 1rem; background: rgba(255,255,255,0.03); border-radius: 6px;">
        <strong style="color: var(--accent-purple);">¿La App tiene flujos de UI muy complejos (wizards, validaciones múltiples)?</strong>
        <br><span style="color: #aaa;">👉 MVI es tu mejor amigo. La máquina de estados simplifica drásticamente la gestión de lógica visual compleja.</span>
    </li>
    <li style="margin-bottom: 1rem; padding: 1rem; background: rgba(255,255,255,0.03); border-radius: 6px;">
        <strong style="color: var(--accent-purple);">¿Es un proyecto a largo plazo (+3 años) con múltiples equipos?</strong>
        <br><span style="color: #aaa;">👉 Clean Architecture es obligatoria. Necesitas modularización para evitar que los equipos se pisen el código.</span>
    </li>
    <li style="margin-bottom: 1rem; padding: 1rem; background: rgba(255,255,255,0.03); border-radius: 6px;">
        <strong style="color: var(--accent-purple);">¿Necesitas compartir lógica con Web o Backend?</strong>
        <br><span style="color: #aaa;">👉 Considera Kotlin Multiplatform (KMP) con Clean Architecture. La capa de Dominio puede ser compartida al 100%.</span>
    </li>
</ul>';
insertSubtopic($conn, 8, '8.4 Matriz de Decisión', $content_8_4);

$content_8_5 = '
<h4 style="color: var(--accent-blue); margin-bottom: 1rem;">Puntos Clave Resumidos</h4>
<ul style="margin-left: 20px; color: #ccc; margin-bottom: 2rem; line-height: 1.8;">
    <li><strong>MVC:</strong> <em>Separación básica.</em> Ideal para empezar, pero peligroso si crece.</li>
    <li><strong>MVP:</strong> <em>Testabilidad imperativa.</em> Mucho código, pero muy robusto para pruebas.</li>
    <li><strong>MVVM:</strong> <em>Reactividad moderna.</em> El estándar actual de la industria. Menos código gracias al Data Binding.</li>
    <li><strong>MVI:</strong> <em>Flujo Unidireccional.</em> Lo mejor para consistencia de estado y debugging. Complejo de aprender.</li>
    <li><strong>Clean Architecture:</strong> <em>Independencia.</em> La estrategia a largo plazo. Protege tu negocio de los cambios tecnológicos.</li>
</ul>
<p style="text-align: center; font-style: italic; color: #888;">"No existe la bala de plata. La mejor arquitectura es la que mejor se adapta a los problemas de TU proyecto."</p>';
insertSubtopic($conn, 8, '8.5 Puntos Clave de cada Modelo', $content_8_5);

$content_8_6 = '
<div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
    <table style="width: 100%; border-collapse: collapse; min-width: 800px; font-size: 0.95rem;">
        <thead>
            <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                <th style="padding: 15px;">Arquitectura</th>
                <th style="padding: 15px;">🏆 Mejor Uso</th>
                <th style="padding: 15px;">🚫 Peor Uso</th>
                <th style="padding: 15px;">Palabra Clave</th>
            </tr>
        </thead>
        <tbody>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">MVC</td>
                <td style="padding: 15px;">Prototipos, Apps Académicas</td>
                <td style="padding: 15px;">Apps Enterprise, Equipos Grandes</td>
                <td style="padding: 15px;"><em>Simplicidad</em></td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">MVP</td>
                <td style="padding: 15px;">Apps medianas con UI compleja</td>
                <td style="padding: 15px;">Frameworks Declarativos (Compose/SwiftUI)</td>
                <td style="padding: 15px;"><em>Control</em></td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">MVVM</td>
                <td style="padding: 15px;">Estándar de Industria, Apps Modernas</td>
                <td style="padding: 15px;">Juegos, Apps triviales</td>
                <td style="padding: 15px;"><em>Reactividad</em></td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">MVI</td>
                <td style="padding: 15px;">Alta concurrencia, Debugging crítico</td>
                <td style="padding: 15px;">Equipos Junior, Proyectos cortos</td>
                <td style="padding: 15px;"><em>Previsibilidad</em></td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Clean Arch</td>
                <td style="padding: 15px;">Proyectos de +5 años, Multi-módulo</td>
                <td style="padding: 15px;">Startups MVP</td>
                <td style="padding: 15px;"><em>Independencia</em></td>
            </tr>
        </tbody>
    </table>
</div>';
insertSubtopic($conn, 8, '8.6 Tabla Comparativa', $content_8_6);


// ======================================================================================
// TEMA 9: CUESTIONARIO
// ======================================================================================
insertTopic($conn, 9, 'Evaluación de Conocimientos', 'Cuestionario interactivo final para validar los conocimientos adquiridos.');

$content_9_1 = '
<div id="quiz-container" style="max-width: 800px; margin: 0 auto;">
    <div class="quiz-header" style="text-align: center; margin-bottom: 2rem;">
        <h3 style="color: var(--accent-blue);">🧠 Desafío de Arquitectura</h3>
        <p>Selecciona las respuestas correctas y envía el formulario al final.</p>
    </div>
    <div id="loading-quiz" style="text-align: center; padding: 2rem;">
        <p>Cargando preguntas...</p>
    </div>
    <form id="quiz-form" style="display: none;">
        <!-- Questions injected here -->
        <div style="text-align: center; margin-top: 3rem; margin-bottom: 3rem;">
            <button type="button" id="btn-submit" style="
                padding: 15px 40px; 
                font-size: 1.2rem; 
                background: linear-gradient(45deg, var(--accent-blue), var(--accent-purple)); 
                color: white; 
                border: none; 
                border-radius: 50px; 
                cursor: pointer; 
                font-weight: bold;
                box-shadow: 0 4px 15px rgba(0,0,0,0.5);
                transition: transform 0.2s;
            ">Enviar Respuestas</button>
        </div>
    </form>
    
    <div id="quiz-results" style="display: none; padding: 2rem; background: #1a1a1a; border-radius: 10px; border: 1px solid #333;">
        <div style="text-align: center; margin-bottom: 2rem;">
            <h2 style="color: #fff;">Resultados</h2>
            <div style="font-size: 2rem; font-weight: bold; color: var(--accent-blue); margin: 1rem 0;">
                <span id="final-score">0</span> / <span id="total-qs">0</span>
            </div>
            <p id="score-message" style="color: #ccc;"></p>
        </div>
        
        <div id="results-details"></div>

        <div style="text-align: center; margin-top: 3rem;">
            <a href="index.php" style="
                padding: 12px 30px; 
                background: #333; 
                color: white; 
                text-decoration: none; 
                border-radius: 5px;
                font-weight: bold;
            ">Volver al Inicio</a>
            <button onclick="location.reload()" style="
                margin-left: 1rem;
                padding: 12px 30px; 
                background: var(--accent-purple); 
                color: white; 
                border: none; 
                border-radius: 5px; 
                cursor: pointer; 
                font-weight: bold;
            ">Intentar de nuevo</button>
        </div>
    </div>
</div>
<script>
    let quizData = [];
    
    document.addEventListener("DOMContentLoaded", function() {
        fetch("api_get_quiz.php")
            .then(response => response.json())
            .then(questions => {
                quizData = questions;
                const form = document.getElementById("quiz-form");
                const loading = document.getElementById("loading-quiz");
                
                loading.style.display = "none";
                form.style.display = "block";

                questions.forEach((q, index) => {
                    const qDiv = document.createElement("div");
                    qDiv.className = "quiz-question card";
                    qDiv.style.marginBottom = "2rem";
                    qDiv.style.padding = "1.5rem";
                    qDiv.innerHTML = `
                        <h4 style="margin-bottom: 1rem; color: #fff;">${index + 1}. ${q.question_text}</h4>
                        <div class="options-grid" style="display: grid; gap: 10px;">
                            <label class="quiz-option" style="display: block; padding: 10px; background: rgba(255,255,255,0.05); border-radius: 5px; cursor: pointer;">
                                <input type="radio" name="q${q.id}" value="A"> ${q.option_a}
                            </label>
                            <label class="quiz-option" style="display: block; padding: 10px; background: rgba(255,255,255,0.05); border-radius: 5px; cursor: pointer;">
                                <input type="radio" name="q${q.id}" value="B"> ${q.option_b}
                            </label>
                            <label class="quiz-option" style="display: block; padding: 10px; background: rgba(255,255,255,0.05); border-radius: 5px; cursor: pointer;">
                                <input type="radio" name="q${q.id}" value="C"> ${q.option_c}
                            </label>
                            <label class="quiz-option" style="display: block; padding: 10px; background: rgba(255,255,255,0.05); border-radius: 5px; cursor: pointer;">
                                <input type="radio" name="q${q.id}" value="D"> ${q.option_d}
                            </label>
                        </div>
                    `;
                    // Insert before the submit button container
                    form.insertBefore(qDiv, form.lastElementChild);
                });

                document.getElementById("btn-submit").addEventListener("click", calculateResults);
            })
            .catch(err => {
                console.error("Error loading quiz:", err);
                document.getElementById("loading-quiz").innerHTML = "<p style=\'color: red;\'>Error al cargar el cuestionario.</p>";
            });
    });

    function calculateResults() {
        let score = 0;
        const resultsDiv = document.getElementById("results-details");
        resultsDiv.innerHTML = "";
        
        let allAnswered = true;

        quizData.forEach(q => {
            const selected = document.querySelector(`input[name="q${q.id}"]:checked`);
            if (!selected) {
                // allAnswered = false; // Optional: force answer all
            }
        });

        // Calculate and build details
        quizData.forEach((q, index) => {
            const selected = document.querySelector(`input[name="q${q.id}"]:checked`);
            const userVal = selected ? selected.value : null;
            const isCorrect = userVal === q.correct_option;
            
            if (isCorrect) score++;

            // Pick random tip
            let tips = [];
            try {
                tips = JSON.parse(q.tips);
            } catch(e) { tips = ["Consejo no disponible."]; }
            const randomTip = tips[Math.floor(Math.random() * tips.length)];

            const resultItem = document.createElement("div");
            resultItem.style.marginBottom = "2rem";
            resultItem.style.padding = "1rem";
            resultItem.style.borderLeft = isCorrect ? "4px solid #4ade80" : "4px solid #f87171";
            resultItem.style.background = "rgba(255,255,255,0.02)";
            resultItem.style.borderRadius = "4px";

            let statusHtml = isCorrect 
                ? `<span style="color: #4ade80; font-weight: bold;">✅ Correcto</span>` 
                : `<span style="color: #f87171; font-weight: bold;">❌ Incorrecto (Tu respuesta: ${userVal || "Ninguna"})</span>`;
            
            let correctAnswerHtml = !isCorrect 
                ? `<p style="color: #ccc; margin-top: 0.5rem;">La respuesta correcta era: <strong>${q.correct_option}</strong></p>` 
                : "";

            resultItem.innerHTML = `
                <h4 style="color: #fff; margin-bottom: 0.5rem;">${index + 1}. ${q.question_text}</h4>
                ${statusHtml}
                ${correctAnswerHtml}
                <div style="margin-top: 1rem; padding-top: 1rem; border-top: 1px solid #333;">
                    <p style="color: #aaa; font-style: italic; font-size: 0.9rem;">💡 <strong>Tip de Aprendizaje:</strong> ${randomTip}</p>
                </div>
            `;
            resultsDiv.appendChild(resultItem);
        });

        // Update UI
        document.getElementById("quiz-form").style.display = "none";
        document.getElementById("quiz-results").style.display = "block";
        document.getElementById("final-score").textContent = score;
        document.getElementById("total-qs").textContent = quizData.length;
        
        const percentage = (score / quizData.length) * 100;
        const msg = document.getElementById("score-message");
        if (percentage === 100) msg.textContent = "¡Excelente! Eres un experto en arquitecturas.";
        else if (percentage >= 80) msg.textContent = "¡Muy bien! Tienes conocimientos sólidos.";
        else if (percentage >= 50) msg.textContent = "Buen intento, pero repasa los temas clave.";
        else msg.textContent = "Te recomendamos leer nuevamente las secciones de aprendizaje.";
        
        window.scrollTo(0, 0);
    }
</script>';
insertSubtopic($conn, 9, '9.1 Cuestionario Final', $content_9_1);

// --- PREGUNTAS DEL QUIZ ---
$quiz_questions = [
    [
        '¿Cuál es el objetivo principal de una arquitectura de software móvil?', 
        'Hacer que la app se vea bonita', 
        'Estructurar el sistema para facilitar mantenimiento y escalabilidad', 
        'Escribir menos código', 
        'Usar la última tecnología disponible', 
        'B', 
        'La arquitectura busca organizar el código para que sea mantenible, escalable y testable a largo plazo.',
        json_encode(['Una buena arquitectura reduce la deuda técnica a largo plazo.', 'La estructura debe ser independiente de las librerías que usas.', 'Piensa en la arquitectura como los cimientos de un edificio.'])
    ],
    [
        'En el patrón MVC, ¿qué componente es responsable de la lógica de negocio y los datos?', 
        'Vista (View)', 
        'Controlador (Controller)', 
        'Modelo (Model)', 
        'Usuario', 
        'C', 
        'El Modelo encapsula la lógica de negocio y el estado de la aplicación, independiente de la interfaz.',
        json_encode(['El Modelo nunca debe importar clases de la Vista (ej: android.view.*).', 'La lógica de negocio debe ser pura y fácil de probar.', 'El Modelo es la "verdad" de tu aplicación.'])
    ],
    [
        '¿Cuál es una desventaja común del patrón MVC en aplicaciones complejas?', 
        'Es demasiado difícil de aprender', 
        'El Controlador tiende a volverse masivo (Massive View Controller)', 
        'No permite usar bases de datos', 
        'La Vista no se puede actualizar', 
        'B', 
        'En apps grandes, el Controlador asume demasiadas responsabilidades, volviéndose difícil de mantener.',
        json_encode(['Divide y vencerás: si una clase tiene 1000 líneas, algo anda mal.', 'MVC es excelente para prototipos, pero cuidado al escalar.', 'El "Massive View Controller" es el anti-patrón más común en iOS/Android clásico.'])
    ],
    [
        'En MVP, ¿cómo se comunican la Vista y el Presentador?', 
        'Directamente accediendo a variables', 
        'A través de interfaces (Contratos)', 
        'Mediante eventos del sistema operativo', 
        'No se comunican', 
        'B', 
        'MVP usa interfaces para desacoplar la Vista del Presentador, facilitando el testing.',
        json_encode(['Las interfaces permiten "mentirle" al Presentador durante los tests (Mocking).', 'El Presentador no debe saber si está en un celular o en una tablet.', 'Humble View: mantén tu vista lo más tonta posible.'])
    ],
    [
        '¿Qué ventaja principal ofrece MVP sobre MVC para el testing?', 
        'No requiere escribir tests', 
        'Permite probar la lógica de presentación sin depender de la UI (Android/iOS)', 
        'Es más rápido de compilar', 
        'Usa menos memoria', 
        'B', 
        'Al aislar la lógica en el Presentador (POJO), se pueden correr tests unitarios sin emuladores.',
        json_encode(['Los tests unitarios son cientos de veces más rápidos que los de UI.', 'Si puedes probar tu lógica en segundos, la probarás más seguido.', 'La inyección de dependencias es clave para un buen testing.'])
    ],
    [
        '¿Qué componente es clave en MVVM para conectar la Vista y el ViewModel?', 
        'El Controlador', 
        'Data Binding u Observables', 
        'Un archivo XML estático', 
        'Una base de datos SQL', 
        'B', 
        'El Data Binding o los patrones de observación (LiveData, StateFlow) permiten que la Vista reaccione automáticamente a cambios en el ViewModel.',
        json_encode(['Observar datos es mejor que pedir datos.', 'El patrón Observer desacopla el productor del consumidor.', 'MVVM brilla cuando usas frameworks reactivos como RxJava o Flow.'])
    ],
    [
        '¿Cuál es el rol del ViewModel en MVVM?', 
        'Dibujar los botones en pantalla', 
        'Guardar datos en el disco duro', 
        'Exponer el estado y manejar la lógica de presentación para la Vista', 
        'Validar transacciones bancarias', 
        'C', 
        'El ViewModel transforma los datos del Modelo para que la Vista los consuma y maneja el estado de la UI.',
        json_encode(['El ViewModel debe sobrevivir a la rotación de pantalla.', 'Nunca pases referencias de View al ViewModel (Memory Leak).', 'El ViewModel transforma datos crudos en datos visualizables.'])
    ],
    [
        '¿Qué característica define al flujo de datos en MVI?', 
        'Es bidireccional y caótico', 
        'Es unidireccional y cíclico (Intent -> Model -> View)', 
        'No hay flujo de datos', 
        'Depende del usuario', 
        'B', 
        'MVI impone un flujo estricto unidireccional donde los Intents generan nuevos estados inmutables.',
        json_encode(['El flujo unidireccional hace que los errores sean fáciles de rastrear.', 'MVI es como Redux pero para móviles.', 'La previsibilidad es la mayor ventaja de MVI.'])
    ],
    [
        'En MVI, el estado de la aplicación es...', 
        'Mutable y distribuido', 
        'Inmutable y centralizado', 
        'Opcional', 
        'Guardado solo en la nube', 
        'B', 
        'MVI trata el estado como inmutable; cada cambio genera una nueva instancia del estado completo.',
        json_encode(['La inmutabilidad previene condiciones de carrera (Race Conditions).', 'Con estados inmutables puedes hacer "Time Travel Debugging".', 'El estado debe representar TODO lo que se ve en pantalla.'])
    ],
    [
        'Según Clean Architecture, ¿hacia dónde deben apuntar las dependencias?', 
        'Hacia afuera (Frameworks)', 
        'Hacia adentro (Reglas de Negocio/Dominio)', 
        'Hacia la base de datos', 
        'Aleatoriamente', 
        'B', 
        'La Regla de Dependencia establece que las capas externas dependen de las internas, nunca al revés.',
        json_encode(['El dominio es el rey, la base de datos es un detalle.', 'Protege tu lógica de negocio de los cambios en frameworks.', 'Las capas internas son las más estables.'])
    ],
    [
        '¿Qué capa se encuentra en el centro de Clean Architecture?', 
        'Presentadores', 
        'Base de Datos', 
        'Entidades (Entities)', 
        'Interfaz de Usuario', 
        'C', 
        'Las Entidades encapsulan las reglas de negocio más generales y de alto nivel.',
        json_encode(['Las entidades no deben tener dependencias de nada externo.', 'Son los objetos de negocio puros de tu aplicación.', 'Si cambia la UI, las entidades no deberían enterarse.'])
    ],
    [
        '¿Cómo logra Clean Architecture que un Caso de Uso obtenga datos de una Base de Datos externa sin depender de ella?', 
        'Usando SQL directo en el Caso de Uso', 
        'Mediante Inversión de Dependencias (Interfaces)', 
        'No es posible', 
        'Usando variables globales', 
        'B', 
        'Se definen interfaces en la capa interna que son implementadas por la capa externa (Inversión de Control).',
        json_encode(['El Caso de Uso define QUÉ necesita, la capa externa define CÓMO obtenerlo.', 'Esto permite cambiar de Room a Realm sin tocar el Caso de Uso.', 'La dependencia en tiempo de compilación apunta hacia adentro, en ejecución se inyecta la implementación.'])
    ],
    [
        'En una arquitectura por capas típica, la capa de presentación debe comunicarse directamente con...', 
        'La base de datos', 
        'La capa de lógica de negocio', 
        'La capa de infraestructura', 
        'Servicios externos', 
        'B', 
        'Para mantener la separación, la presentación habla con la lógica, y esta con los datos.',
        json_encode(['Saltar capas crea "Spaghetti Code".', 'Respeta la jerarquía para mantener el orden.', 'Cada capa debe tener una responsabilidad única.'])
    ],
    [
        'Si tienes un equipo junior y necesitas un prototipo rápido para mañana, ¿qué arquitectura elegirías?', 
        'Clean Architecture', 
        'MVI', 
        'MVC', 
        'Microservicios', 
        'C', 
        'MVC es la más simple y rápida de implementar para proyectos pequeños o prototipos.',
        json_encode(['No mates moscas a cañonazos: usa la herramienta adecuada.', 'La complejidad innecesaria es el enemigo del desarrollo rápido.', 'Siempre puedes refactorizar después (si sobrevives).'])
    ],
    [
        '¿Qué arquitectura es ideal para una app bancaria que requiere alta trazabilidad y cero errores de estado?', 
        'MVC', 
        'MVP', 
        'MVI', 
        'No importa', 
        'C', 
        'MVI ofrece un control de estado predecible y unidireccional, ideal para apps críticas y complejas.',
        json_encode(['En finanzas, la consistencia de datos es más importante que la velocidad de desarrollo.', 'MVI previene estados imposibles en la UI.', 'La trazabilidad de MVI facilita las auditorías de código.'])
    ]
];

$stmt_quiz = $conn->prepare("INSERT INTO quiz_questions (question_text, option_a, option_b, option_c, option_d, correct_option, explanation, tips) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
foreach ($quiz_questions as $q) {
    $stmt_quiz->bind_param("ssssssss", $q[0], $q[1], $q[2], $q[3], $q[4], $q[5], $q[6], $q[7]);
    $stmt_quiz->execute();
}

echo "RESTAURACIÓN FINALIZADA.\n";
?>
