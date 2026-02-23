
SET NAMES utf8mb4;
CREATE DATABASE IF NOT EXISTS mobile_architectures CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mobile_architectures;

-- Clean up existing tables
DROP TABLE IF EXISTS `quiz_questions`;
DROP TABLE IF EXISTS `subtemas`;
DROP TABLE IF EXISTS `temas`;

-- Table structure for table `temas`
CREATE TABLE `temas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `subtemas`
CREATE TABLE `subtemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`tema_id`) REFERENCES `temas`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table for Quiz Questions
CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_option` char(1) NOT NULL,
  `explanation` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `temas`
INSERT INTO `temas` (`id`, `titulo`, `descripcion`) VALUES
(1, 'Introducción a las arquitecturas móviles', 'Conceptos básicos y objetivos de la arquitectura en el desarrollo móvil.'),
(2, 'Arquitectura MVC (Model–View–Controller)', 'El patrón clásico que separa la aplicación en tres componentes principales.'),
(3, 'Arquitectura MVP (Model–View–Presenter)', 'Una evolución de MVC que busca desacoplar la vista del modelo a través de un presentador.'),
(4, 'Arquitectura MVVM (Model–View–ViewModel)', 'Facilita la separación del desarrollo de la interfaz gráfica del desarrollo de la lógica de negocio.'),
(5, 'Arquitectura MVI (Model–View–Intent)', 'Un patrón reactivo y unidireccional inspirado en Cycle.js y Redux.'),
(6, 'Clean Architecture en aplicaciones móviles', 'Arquitectura propuesta por Uncle Bob para crear sistemas independientes de frameworks y UI.'),
(7, 'Arquitectura en capas (Layered Architecture)', 'Organización del código en capas lógicas como presentación, dominio y datos.'),
(8, 'Comparación de arquitecturas móviles', 'Análisis comparativo de los diferentes patrones arquitectónicos.'),
(9, 'Evaluación de Conocimientos', 'Cuestionario interactivo para poner a prueba lo aprendido sobre arquitecturas móviles.');
-- Update 1.1: Definición Ampliada
UPDATE subtemas 
SET contenido = '
<div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
    <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición Formal</h4>
    <p>La arquitectura de software en aplicaciones móviles se define como la <strong>estructura organizativa del software</strong> de una aplicación móvil, donde se establecen los componentes principales, sus responsabilidades y las interacciones entre ellos.</p>
</div>

<p>Esencialmente, es un conjunto de <strong>patrones, principios y técnicas estructurales</strong> que guían el diseño y la implementación del código, asegurando que la aplicación sea eficiente, flexible y adaptable a cambios futuros. De manera más técnica, representa las decisiones de diseño relacionadas con la estructura y el comportamiento global del sistema, compuesta por elementos con propiedades visibles externamente y las relaciones entre ellos.</p>

<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/CleanArchitecture.jpg" alt="Clean Architecture Diagram" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
    <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama de Arquitectura Móvil (Clean Architecture)</p>
</div>

<h4 style="margin-top: 2rem; color: var(--accent-purple);">Función Principal</h4>
<p>Su función principal dentro del desarrollo de aplicaciones móviles es establecer la base conceptual para construir sistemas escalables y mantenibles. Actúa como un "plano" que:</p>

<ul class="feature-list" style="margin-left: 1.5rem; margin-bottom: 2rem; color: #ccc;">
    <li><strong>Simplifica</strong> los procesos de desarrollo.</li>
    <li>Ofrece una <strong>visualización clara</strong> de los requisitos técnicos y funcionales.</li>
    <li>Permite enfrentar <strong>constantes cambios</strong> en el ecosistema móvil (actualizaciones de SO, nuevos dispositivos o requisitos de usuario).</li>
    <li>Facilita la <strong>integración</strong> con servicios externos como APIs, bases de datos o redes.</li>
</ul>

<p>En plataformas como Android e iOS, la arquitectura es la base para crear apps de alta calidad, adaptables a entornos en expansión. Sin una arquitectura bien definida, el desarrollo puede volverse caótico, con código difícil de depurar o escalar.</p>

<div class="highlight-box" style="border: 1px dashed var(--accent-blue); padding: 1rem; border-radius: 8px; margin-top: 1rem; background: rgba(0, 198, 255, 0.05);">
    <strong>Resumen:</strong> La arquitectura móvil no solo organiza el código, sino que alinea el diseño con factores determinantes como requisitos funcionales (lo que la app debe hacer) y no funcionales (rendimiento, seguridad, usabilidad).
</div>
' 
WHERE tema_id = 1 AND titulo LIKE '1.1%';

-- Update 1.2: Objetivos Fundamentales
UPDATE subtemas 
SET contenido = '
<p>Los objetivos de una arquitectura móvil se centran en optimizar el desarrollo y el ciclo de vida de la aplicación. A continuación, se detallan los objetivos clave:</p>

<div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🧩 Organización del Código</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Facilita una estructura modular y clara, reduciendo la complejidad y permitiendo que diferentes partes del sistema interactúen eficientemente.</p>
    </div>

    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #0072ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🛠️ Mantenimiento</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Un diseño bien estructurado hace que el código sea más limpio, fácil de actualizar, corregir errores o agregar funcionalidades sin comprometer la integridad general.</p>
    </div>

    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">📈 Escalabilidad</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Asegura que la aplicación pueda crecer, manejando más usuarios, datos o características nuevas, sin necesidad de reescrituras masivas.</p>
    </div>

    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🎭 Separación de Responsabilidades</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Divide el sistema en componentes independientes (como lógica de negocio, interfaz y datos), cumpliendo con requisitos funcionales y no funcionales.</p>
    </div>
</div>

<h4 style="margin-top: 2rem; color: var(--accent-purple);">Otros Objetivos Clave</h4>
<ul style="margin-left: 1.5rem; margin-bottom: 2rem; color: #ccc;">
    <li><strong>Mejorar la testabilidad:</strong> Facilitando la creación de pruebas unitarias y de integración.</li>
    <li><strong>Promover la reutilización:</strong> Aprovechar componentes de código en múltiples partes del proyecto o en futuros desarrollos.</li>
    <li><strong>Calidad y rapidez:</strong> Garantizar un software de calidad distribuido rápidamente, alineado con metas empresariales.</li>
    <li><strong>Adaptabilidad:</strong> Manejo de conexiones intermitentes, optimización de batería y soporte a diversidad de dispositivos.</li>
</ul>
' 
WHERE tema_id = 1 AND titulo LIKE '1.2%';

-- Insert new subtopics based on the research provided
-- We need to check if these exist first or just insert. Since the user wants to "expand", let's add them as new subtopics for Topic 1 or Topic 8 (Comparison), or maybe create new main topics?
-- The user asked to expand the theme. The provided text has Section 2 "Tipos de Arquitecturas", Section 3 "Principios...", Section 4 "Consideraciones...".
-- Let's map these to the existing structure or add new ones.
-- The existing structure has specific topics for MVC, MVP, MVVM, etc.
-- Let's update the specific topics with the new info if applicable, or add a general "Tipos de Arquitecturas" overview in Topic 1 or 8.
-- The user provided text for "2. Tipos de Arquitecturas..." which is a comparison/overview. This fits well in Topic 8 "Comparación de arquitecturas móviles".

UPDATE subtemas 
SET contenido = '
<p>Para una investigación completa, analizamos los principales tipos de arquitecturas utilizadas en apps móviles. Estos patrones resuelven problemas comunes y se eligen según la complejidad del proyecto, el equipo y las necesidades de escalabilidad.</p>

<div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem;">
    <table style="width: 100%; border-collapse: collapse; min-width: 600px; font-size: 0.9rem;">
        <thead>
            <tr style="background: var(--accent-blue); color: white;">
                <th style="padding: 10px; text-align: left;">Patrón</th>
                <th style="padding: 10px; text-align: left;">Descripción Breve</th>
                <th style="padding: 10px; text-align: left;">Ventajas</th>
                <th style="padding: 10px; text-align: left;">Desventajas</th>
            </tr>
        </thead>
        <tbody>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 10px; font-weight: bold; color: var(--accent-blue);">MVC</td>
                <td style="padding: 10px;">Divide en Modelo, Vista y Controlador.</td>
                <td style="padding: 10px;">Fácil de entender; separa lógica de IU.</td>
                <td style="padding: 10px;">Controladores masivos en apps complejas.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 10px; font-weight: bold; color: var(--accent-blue);">MVP</td>
                <td style="padding: 10px;">Similar a MVC, Presenter maneja lógica de presentación.</td>
                <td style="padding: 10px;">Mejor separación; facilita pruebas.</td>
                <td style="padding: 10px;">Más código y complejidad.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 10px; font-weight: bold; color: var(--accent-blue);">MVVM</td>
                <td style="padding: 10px;">Usa ViewModel y data binding.</td>
                <td style="padding: 10px;">Reduce boilerplate; escalable.</td>
                <td style="padding: 10px;">ViewModel puede crecer descontrolado.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 10px; font-weight: bold; color: var(--accent-blue);">VIPER</td>
                <td style="padding: 10px;">View, Interactor, Presenter, Entity, Router.</td>
                <td style="padding: 10px;">Separación estricta; alto mantenimiento.</td>
                <td style="padding: 10px;">Muy complejo; muchos archivos.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 10px; font-weight: bold; color: var(--accent-blue);">Clean Architecture</td>
                <td style="padding: 10px;">Capas concéntricas independientes.</td>
                <td style="padding: 10px;">Independencia total; testable.</td>
                <td style="padding: 10px;">Curva de aprendizaje alta.</td>
            </tr>
        </tbody>
    </table>
</div>

<h3 style="color: var(--accent-purple); margin-top: 2rem;">Detalles de Patrones Principales</h3>

<div class="pattern-detail" style="margin-bottom: 2rem;">
    <h4 style="color: #fff;">MVC (Model-View-Controller)</h4>
    <p>El patrón más básico, donde el Controlador actúa como cerebro. Ideal para proyectos simples.</p>
    <div style="text-align: center; margin: 1rem 0;">
        <img src="images/MVC3.webp" alt="Diagrama MVC" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
    </div>
</div>

<div class="pattern-detail" style="margin-bottom: 2rem;">
    <h4 style="color: #fff;">MVVM (Model-View-ViewModel)</h4>
    <p>Evolución que enfatiza el data binding. Recomendado por Google para Android.</p>
    <div style="text-align: center; margin: 1rem 0;">
        <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=mvvm%20architecture%20diagram%20mobile%20model%20view%20viewmodel%20binding%20tech&image_size=landscape_16_9" alt="Diagrama MVVM" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
    </div>
</div>

<div class="pattern-detail" style="margin-bottom: 2rem;">
    <h4 style="color: #fff;">Clean Architecture</h4>
    <p>Basada en capas independientes con el núcleo en entidades de negocio.</p>
    <div style="text-align: center; margin: 1rem 0;">
        <img src="images/CleanArchitecture.jpg" alt="Diagrama Clean Architecture" style="max-width: 80%; border-radius: 8px; border: 1px solid #333;">
    </div>
</div>
' 
WHERE tema_id = 8; -- Updating the "Comparación" topic

-- Add new subtopic for "Consideraciones Prácticas" if it doesn't exist, or append to Topic 1?
-- Let's put "Principios y Capas Recomendadas" as a new subtopic in Topic 1 (Introducción) as 1.4? Or maybe create a new Topic for it?
-- The user structure had "7. Arquitectura en capas". Let's update that one.

UPDATE subtemas 
SET contenido = '
<h4 style="color: var(--accent-blue);">Principios y Capas Recomendadas</h4>
<p>En guías oficiales como la de Android Developers, se recomienda una arquitectura en capas con al menos <strong>UI</strong> y <strong>Datos</strong>, y opcionalmente <strong>Dominio</strong>.</p>

<ul style="margin-left: 1.5rem; margin-bottom: 2rem; color: #ccc;">
    <li><strong>Separación de problemas:</strong> Cada capa tiene una responsabilidad única.</li>
    <li><strong>Diseños adaptables:</strong> La UI debe reaccionar a diferentes tamaños de pantalla.</li>
    <li><strong>Modelos de datos controlando la UI:</strong> La UI se reconstruye a partir de los datos, no al revés.</li>
    <li><strong>SSOT (Single Source of Truth):</strong> Una única fuente de verdad para los datos.</li>
    <li><strong>UDF (Unidirectional Data Flow):</strong> El flujo de datos es unidireccional para evitar estados inconsistentes.</li>
</ul>

<h4 style="color: var(--accent-purple);">Tendencias 2026</h4>
<p>En 2026, las tendencias incluyen integración de IA para UIs dinámicas, arquitecturas modulares/microservices para escalabilidad y event-driven para real-time. Patrones como MVI y optimización impulsada por IA ganan tracción.</p>

<div class="highlight-box" style="border-left: 4px solid var(--accent-purple); background: rgba(128, 0, 128, 0.1); padding: 1rem; margin-top: 1rem;">
    <strong>Mejores Prácticas:</strong>
    <ul style="margin-left: 1.5rem; margin-top: 0.5rem;">
        <li>Separación de Concerns y SSOT.</li>
        <li>Inyección de Dependencias (DI).</li>
        <li>Offline-First y Adaptabilidad.</li>
        <li>Seguridad y Rendimiento optimizados para batería.</li>
    </ul>
</div>
'
WHERE tema_id = 7; -- Arquitectura en capas

USE mobile_architectures;

-- 1. Limpiar subtemas existentes del Tema 2 para evitar conflictos
DELETE FROM subtemas WHERE tema_id = 2;

-- 2. Insertar nuevo contenido para el Tema 2

-- 2.1 Definición de MVC
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.1 Definición de MVC', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Concepto Clave</h4>
        <p><strong>MVC (Model-View-Controller)</strong> se define como una arquitectura o patrón de diseño que divide la aplicación en tres componentes principales interconectados: <strong>Modelo (Model)</strong>, <strong>Vista (View)</strong> y <strong>Controlador (Controller)</strong>, con el objetivo principal de separar la lógica de negocio y los datos de la interfaz de usuario.</p>
    </div>

    <p>Este patrón, originado en los años 70 para interfaces gráficas, es ampliamente utilizado en desarrollo móvil (como en Android con Activities como Controllers, o iOS con UIViewControllers), ya que facilita la <strong>separación de preocupaciones (separation of concerns)</strong>, permitiendo que cambios en la UI no afecten la lógica de datos y viceversa.</p>

    <p>En apps móviles, MVC organiza el código en capas, donde el flujo típico es: el usuario interactúa con la View, que notifica al Controller; este actualiza el Model y refresca la View, asegurando eficiencia en entornos con recursos limitados como batería o memoria. Aunque no es estrictamente implementado en frameworks móviles modernos (que prefieren MVVM o MVP para mejor testabilidad), MVC sirve como base para apps simples, reduciendo complejidad y facilitando colaboración en equipos.</p>

    <div class="highlight-box" style="border: 1px dashed var(--accent-purple); padding: 1rem; border-radius: 8px; margin-top: 1rem; background: rgba(128, 0, 128, 0.05);">
        <strong>Resumen:</strong> MVC es un patrón clásico que transforma el desarrollo de apps complejas en un proceso manejable, alineado con principios de modularidad y reutilización.
    </div>

    <div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
        <img src="images/MVC3.webp" alt="Diagrama Ilustrativo de MVC" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
        <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama Ilustrativo de MVC</p>
    </div>
    '
);

-- 2.2 Componentes de MVC
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.2 Componentes de MVC', 
    '
    <p>Los componentes de MVC se dividen en tres roles interconectados, cada uno con responsabilidades específicas para mantener la separación de preocupaciones en aplicaciones móviles.</p>

    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">📦 Modelo (Model)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Gestiona los datos y la lógica de negocio, representando entidades del mundo real (usuarios, productos). Es responsable de almacenar, recuperar y manipular datos, aplicar reglas de negocio y validar integridad sin conocimiento de la UI.</p>
            <p style="font-size: 0.8rem; color: #888; margin-top: 0.5rem;"><em>Ejemplo: En e-commerce, maneja inventario y precios.</em></p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">👁️ Vista (View)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Se encarga de la interfaz de usuario, presentando datos visualmente y manejando interacciones (botones, listas). Es pasiva y se enfoca en renderización, no lógica.</p>
            <p style="font-size: 0.8rem; color: #888; margin-top: 0.5rem;"><em>Ejemplo: XML layouts en Android, Storyboards en iOS.</em></p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🎮 Controlador (Controller)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Intermediario entre Model y View. Procesa entradas del usuario, actualiza el Model y refresca la View. Contiene la lógica principal de la aplicación.</p>
            <p style="font-size: 0.8rem; color: #888; margin-top: 0.5rem;"><em>Ejemplo: Activities en Android, UIViewController en iOS.</em></p>
        </div>

    </div>

    <p style="margin-top: 2rem; color: #aaa; font-style: italic;">Estos componentes interactúan unidireccionalmente: View → Controller → Model → Controller → View, asegurando un flujo eficiente.</p>
    '
);

-- 2.3 Flujo de Comunicación en MVC
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.3 Flujo de Comunicación en MVC', 
    '
    <p>Este subtema describe cómo fluye la información entre el Modelo, la Vista y el Controlador en MVC. El flujo es unidireccional y cíclico, basado en el principio de separación de preocupaciones.</p>

    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
        <ol style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;">
                <strong>Acción del usuario en la Vista:</strong> El usuario interactúa con la interfaz (presiona un botón), generando un evento que se envía al Controlador.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Procesamiento en el Controlador:</strong> Recibe la entrada, valida, aplica lógica y decide si actualizar el Modelo.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Actualización del Modelo:</strong> Procesa cambios (interactuando con DB o API), actualiza sus datos y notifica al Controlador.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Refresco de la Vista:</strong> El Controlador recibe la notificación, obtiene datos actualizados y los envía a la Vista para mostrar los cambios.
            </li>
        </ol>
    </div>

    <div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
        <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=mvc%20architecture%20communication%20flow%20diagram%20user%20action%20controller%20model%20view%20cycle%20neon%20tech&image_size=landscape_16_9" alt="Diagrama de Flujo MVC" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
        <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama del Flujo de Comunicación en MVC</p>
    </div>
    '
);

-- 2.4 Aplicación de MVC en Entornos Móviles
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.4 Aplicación de MVC en Entornos Móviles', 
    '
    <p>Se analiza cómo se implementa MVC en aplicaciones móviles y las particularidades que presenta en plataformas como Android e iOS, donde algunos componentes pueden combinar responsabilidades para optimizar rendimiento.</p>

    <div class="platform-comparison" style="display: flex; flex-direction: column; gap: 2rem; margin-top: 2rem;">
        
        <div class="android-section" style="border-left: 4px solid #3ddc84; padding-left: 1.5rem;">
            <h3 style="color: #3ddc84;">🤖 Implementación en Android</h3>
            <p>MVC se implementa con <strong>Activities o Fragments</strong> como Controladores, <strong>XML layouts</strong> como Vistas, y clases POJO como Modelos.</p>
            <p><strong>Particularidad:</strong> Los Controladores combinan responsabilidades de UI y lógica para eficiencia, pero pueden volverse clases infladas ("God Objects").</p>
            <div class="diagram-placeholder" style="margin: 1rem 0;">
                <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=android%20mvc%20architecture%20diagram%20activity%20xml%20model%20flow%20green%20tech%20style&image_size=landscape_16_9" alt="MVC en Android" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
            </div>
        </div>

        <div class="ios-section" style="border-left: 4px solid #007aff; padding-left: 1.5rem;">
            <h3 style="color: #007aff;">🍎 Implementación en iOS</h3>
            <p>MVC es el patrón nativo. <strong>UIViewController</strong> combina roles de Vista y Controlador, mientras que Modelos son clases separadas.</p>
            <p><strong>Particularidad:</strong> Optimizado para interfaces táctiles y ciclos de vida, pero propenso a "Massive View Controllers".</p>
            <div class="diagram-placeholder" style="margin: 1rem 0;">
                <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=ios%20mvc%20architecture%20diagram%20viewcontroller%20storyboard%20model%20blue%20tech%20style&image_size=landscape_16_9" alt="MVC en iOS" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
            </div>
        </div>

    </div>

    <div class="highlight-box" style="margin-top: 2rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 8px;">
        <h4 style="color: var(--text-main);">Conclusión</h4>
        <p>En ambas plataformas, MVC facilita el desarrollo inicial pero suele evolucionar a MVVM o Clean Architecture en aplicaciones complejas para mejorar la testabilidad y el mantenimiento.</p>
    </div>
    '
);

USE mobile_architectures;

-- Insertar el nuevo subtema 2.5: Análisis de Costos y Evaluación de MVC
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.5 Ventajas y Desventajas de la arquitectura MVC', 
    '
    <p>A continuación se presenta un análisis detallado de costos y evaluación de la arquitectura MVC en aplicaciones móviles, integrando comparaciones con otros modelos y especificando cuándo representa una ventaja o desventaja.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem; margin-bottom: 1rem;">📊 Análisis de Costos y Evaluación</h4>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 25%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 37.5%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Cuándo es Ventaja (y por qué)</th>
                    <th style="padding: 15px; text-align: left; width: 37.5%;">❌ Cuándo es Desventaja (y por qué)</th>
                </tr>
            </thead>
            <tbody>
                <!-- Concepto General -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Concepto General</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Modelo simple.</strong> Es fácil de comprender y estructurar mentalmente, lo que facilita la comunicación inicial del equipo.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede volverse complejo y difícil de manejar en aplicaciones grandes debido a la falta de reglas estrictas de comunicación.
                    </td>
                </tr>
                <!-- Aprendizaje -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Aprendizaje</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Baja curva de aprendizaje.</strong> Ideal para desarrolladores principiantes o equipos que necesitan integrar nuevos miembros rápidamente.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Requiere mayor disciplina y organización manual a medida que crece el proyecto para evitar "Spaghetti Code".
                    </td>
                </tr>
                <!-- Implementación -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Implementación</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Rápida implementación en proyectos pequeños o medianos (MVPs) al tener menos capas de abstracción.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        En proyectos complejos puede generar una estructura monolítica difícil de mantener y evolucionar.
                    </td>
                </tr>
                <!-- Organización del Código -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Organización del Código</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Separa claramente Modelo, Vista y Controlador, mejorando la estructura inicial frente a no usar arquitectura.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede surgir acoplamiento excesivo entre la Vista y el Controlador, llevando al anti-patrón "Massive View Controller".
                    </td>
                </tr>
                <!-- Escalabilidad -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Funciona perfectamente bien en aplicaciones sencillas, prototipos y pruebas de concepto.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        No es ideal para aplicaciones móviles de gran escala (Enterprise) debido a la rigidez y dificultad para modularizar.
                    </td>
                </tr>
                <!-- Costo Inicial -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo Inicial</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Bajo costo.</strong> Requiere configuración mínima y herramientas estándar gratuitas.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        La deuda técnica puede aumentar rápidamente, requiriendo refactorización costosa a futuro si no se migra a tiempo.
                    </td>
                </tr>
                <!-- Testing -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Permite pruebas unitarias sencillas para el Modelo (lógica de negocio pura y datos).
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Es muy difícil probar la lógica de UI y del Controlador debido al alto acoplamiento con las APIs del sistema operativo.
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="highlight-box" style="border: 1px dashed var(--accent-blue); padding: 1rem; border-radius: 8px; margin-top: 1rem; background: rgba(0, 198, 255, 0.05);">
        <strong>Conclusión del Análisis:</strong> MVC es la opción más costo-efectiva para prototipos y aplicaciones de baja complejidad, pero su deuda técnica aumenta exponencialmente con el tamaño del proyecto, donde arquitecturas como MVVM o Clean Architecture ofrecen mejor retorno de inversión a largo plazo.
    </div>
    '
);

USE mobile_architectures;

-- 1. Limpiar subtemas existentes del Tema 3 para evitar duplicados
DELETE FROM subtemas WHERE tema_id = 3;

-- 2. Insertar nuevo contenido para el Tema 3 (MVP)

-- 3.1 Definición y Concepto
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    3, 
    '3.1 Definición y Concepto de MVP', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">¿Qué es MVP?</h4>
        <p><strong>MVP (Model-View-Presenter)</strong> es un patrón de arquitectura derivado de MVC, diseñado específicamente para facilitar las pruebas unitarias y mejorar la separación de responsabilidades en interfaces de usuario modernas.</p>
    </div>

    <p>A diferencia de MVC, donde la Vista y el Modelo pueden estar estrechamente acoplados, en MVP el <strong>Presentador</strong> actúa como un intermediario estricto. La Vista es pasiva y no conoce al Modelo; toda la lógica de presentación se delega al Presentador.</p>

    <p>Este desacoplamiento permite que la lógica de la interfaz sea independiente de la plataforma (Android/iOS/Web), facilitando su prueba mediante tests unitarios sin necesidad de emuladores o dispositivos físicos.</p>

    <div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
        <img src="images/mvp.png" alt="Diagrama de Arquitectura MVP" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
        <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Estructura y Flujo en MVP</p>
    </div>
    '
);

-- 3.2 Componentes Principales
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    3, 
    '3.2 Componentes Principales', 
    '
    <p>La arquitectura MVP se compone de tres elementos fundamentales que interactúan a través de interfaces (contratos):</p>

    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">📦 Modelo (Model)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Responsable de los datos y la lógica de negocio. Accede a bases de datos, APIs o preferencias. Es idéntico al Modelo en MVC y no sabe nada de la Vista ni del Presentador.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">👁️ Vista (View)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Interfaz pasiva que muestra datos y captura eventos del usuario. En MVP, la Vista implementa una interfaz que el Presentador utiliza para actualizarla, sin contener lógica alguna.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🎤 Presentador (Presenter)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">El "cerebro" de la interacción. Recibe eventos de la Vista, solicita datos al Modelo, aplica lógica de presentación y actualiza la Vista a través de su interfaz. No depende de frameworks de UI.</p>
        </div>

    </div>
    '
);

-- 3.3 Dinámica de Funcionamiento
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    3, 
    '3.3 Dinámica de Funcionamiento', 
    '
    <p>El flujo de información en MVP es bidireccional entre Vista y Presentador, pero siempre a través de interfaces, garantizando un bajo acoplamiento.</p>

    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
        <h4 style="color: var(--accent-purple); margin-bottom: 1rem;">Ciclo de Interacción Típico:</h4>
        <ol style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;">
                <strong>Evento de Usuario:</strong> El usuario realiza una acción en la <em>Vista</em> (ej. clic en "Guardar").
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Notificación:</strong> La <em>Vista</em> llama a un método del <em>Presentador</em> (ej. `presenter.onSaveClicked()`).
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Lógica y Datos:</strong> El <em>Presentador</em> procesa la acción y solicita datos al <em>Modelo</em> si es necesario.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Actualización de UI:</strong> El <em>Presentador</em> recibe la respuesta del Modelo y llama a métodos de la interfaz de la <em>Vista</em> (ej. `view.showSuccessMessage()`) para mostrar el resultado.
            </li>
        </ol>
    </div>

    <p style="margin-top: 1rem;">Esta separación permite cambiar la implementación de la Vista (ej. de Android XML a Jetpack Compose) sin tocar una sola línea de lógica en el Presentador.</p>
    '
);

-- 3.4 Implementación y Ventajas
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    3, 
    '3.4 Implementación y Ventajas', 
    '
    <h4 style="color: var(--accent-blue);">Ventajas Clave</h4>
    <ul style="margin-left: 1.5rem; margin-bottom: 2rem; color: #ccc;">
        <li><strong>Testabilidad:</strong> Al no depender de librerías de UI en el Presentador, se pueden escribir tests unitarios rápidos y fiables (JUnit).</li>
        <li><strong>Separación de Responsabilidades:</strong> Código más limpio y mantenible. La Vista solo se preocupa de "cómo" mostrar, y el Presentador de "qué" mostrar.</li>
        <li><strong>Reutilización:</strong> Un mismo Presentador podría, teóricamente, controlar diferentes Vistas (ej. móvil y tablet).</li>
    </ul>

    <h4 style="color: var(--accent-purple);">Desventajas</h4>
    <ul style="margin-left: 1.5rem; margin-bottom: 2rem; color: #ccc;">
        <li><strong>Verbosidad:</strong> Requiere crear muchas interfaces y clases (Contratos) para conectar Vistas y Presentadores.</li>
        <li><strong>Curva de Aprendizaje:</strong> Entender la comunicación a través de interfaces puede ser complejo para principiantes.</li>
    </ul>
    '
);

-- 3.5 Análisis de Costos y Evaluación (Basado en ChatGPT)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    3, 
    '3.5 Análisis de Costos y Evaluación', 
    '
    <p>A continuación se presenta un análisis detallado de costos y evaluación de la arquitectura MVP, integrando comparaciones con otros modelos y especificando cuándo representa una ventaja o desventaja.</p>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Cuándo es Ventaja (y por qué)</th>
                    <th style="padding: 15px; text-align: left; width: 40%;">❌ Cuándo es Desventaja (y por qué)</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial de implementación</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Moderado.</strong> Aunque las herramientas son gratuitas, mejora la organización desde el inicio comparado con MVC.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mayor inversión inicial en tiempo de desarrollo debido a la creación de más clases e interfaces (contratos), lo que puede aumentar el costo en proyectos pequeños.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Infraestructura y herramientas</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Compatible con herramientas estándar gratuitas (Android Studio, Xcode, Git). No requiere licencias especiales.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        No reduce costos de infraestructura per se; si la app crece, los servicios cloud incrementan el gasto independientemente de la arquitectura.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Más estructurado que MVC, reduce el retrabajo y la deuda técnica en proyectos medianos a largo plazo.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede ser más lento al inicio debido a la implementación de contratos (interfaces) entre Vista y Presentador (Boilerplate).
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Mejor que MVC en aplicaciones de complejidad media, gracias a un menor acoplamiento entre componentes de UI y lógica.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        En proyectos muy grandes (Enterprise), puede requerir complementarse con Clean Architecture para evitar Presentadores gigantes.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento a largo plazo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Reduce costos de mantenimiento significativamente porque separa claramente la lógica de presentación de la Vista.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede volverse complejo si existen demasiados Presentadores o si no se mantiene una buena organización de paquetes.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Gran ventaja.</strong> El Presentador puede probarse fácilmente mediante pruebas unitarias (JVM) sin depender de la UI o emuladores.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Requiere configuración adicional para pruebas (Mocks), lo que puede aumentar ligeramente el costo inicial de QA.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Comparación con MVC</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Ofrece mejor organización, menor acoplamiento y superior capacidad de testing, reduciendo costos futuros de refactorización.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Introduce más código y estructura que MVC, lo que puede ser sobreingeniería innecesaria para apps muy simples o prototipos.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Comparación con Clean Architecture</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Menor costo y complejidad inicial que Clean Architecture; es más fácil de entender e implementar para equipos medianos.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Clean Architecture ofrece mejor modularidad y escalabilidad en proyectos empresariales masivos, donde MVP podría quedarse corto.
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="highlight-box" style="border: 1px dashed var(--accent-blue); padding: 1rem; border-radius: 8px; margin-top: 1rem; background: rgba(0, 198, 255, 0.05);">
        <strong>Conclusión del Análisis:</strong> MVP es ideal para proyectos de complejidad media donde la testabilidad es prioritaria, ofreciendo un excelente equilibrio entre estructura y costo de implementación, superando a MVC en mantenimiento pero siendo más ligero que Clean Architecture.
    </div>
    '
);

USE mobile_architectures;

-- 1. Limpiar subtemas existentes del Tema 4
DELETE FROM subtemas WHERE tema_id = 4;

-- 2. Insertar nuevo contenido para el Tema 4 (MVVM)

-- 4.1 Definición
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    4, 
    '4.1 Definición de MVVM', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición Ampliada y Fundamentada</h4>
        <p><strong>MVVM (Model-View-ViewModel)</strong> representa un patrón arquitectónico diseñado para desacoplar de manera efectiva la lógica de negocio, la lógica de presentación y la interfaz gráfica del usuario, introduciendo un intermediario clave conocido como <strong>ViewModel</strong>.</p>
    </div>

    <p>Este patrón se deriva como una variante especializada del Presentation Model y una refinación del clásico MVC, adaptada específicamente para entornos que incorporan mecanismos de <strong>data binding automático</strong> y enfoques de <strong>programación reactiva</strong>, facilitando una interacción más fluida entre componentes. En práctica, MVVM permite que las actualizaciones en los datos se propaguen automáticamente a la interfaz sin requerir código imperativo extenso, lo que reduce la complejidad en aplicaciones con interfaces dinámicas y reduce el riesgo de errores relacionados con sincronización manual.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">📌 Fundamento Teórico</h4>
    <p>El MVVM se sustenta en principios fundamentales de la ingeniería de software:</p>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>Separación de Responsabilidades (SoC):</strong> Asegura que cada módulo se enfoque en una tarea específica.</li>
        <li><strong>Inversión de Dependencias:</strong> Promueve dependencias abstractas para mayor flexibilidad y testabilidad.</li>
        <li><strong>Patrón Observer:</strong> Permite notificaciones automáticas de cambios en tiempo real.</li>
        <li><strong>Arquitecturas Orientadas a Estado:</strong> Donde el estado centralizado dicta el comportamiento.</li>
        <li><strong>Programación Reactiva:</strong> Maneja flujos de datos dinámicos y eventos asincrónicos.</li>
    </ul>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">📊 Nivel de Adopción Actual</h4>
    <p>En el panorama actual, MVVM es promovido como estándar en:</p>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>Android:</strong> Integrado con Jetpack (ViewModel, LiveData) y Clean Architecture.</li>
        <li><strong>iOS:</strong> Con SwiftUI, que se alinea naturalmente con MVVM gracias a su enfoque basado en estado observable.</li>
        <li><strong>.NET (MAUI/WPF):</strong> Base para interfaces ricas en XAML.</li>
    </ul>
    <p>Se aplica en escenarios reales como apps bancarias, plataformas de transporte y comercio electrónico. En proyectos de larga duración (3 a 5 años), las arquitecturas desacopladas como MVVM agilizan la incorporación de nuevos desarrolladores y optimizan el mantenimiento.</p>
    '
);

-- 4.2 Componentes
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    4, 
    '4.2 Componentes de MVVM', 
    '
    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 Model (Capa de Dominio y Datos)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Encapsula las entidades del negocio, casos de uso, accesos a bases de datos y APIs. Es el corazón funcional y debe mantenerse independiente de la UI. En proyectos grandes, se estratifica en dominio puro, datos y repositorios, facilitando la integración con SQL/NoSQL o servicios cloud como Firebase.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 View (Capa de Presentación Visual)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Se limita a renderizar datos y capturar eventos (toques, gestos). Se suscribe al ViewModel para reflejar cambios en tiempo real. Adopta un rol pasivo, ideal para interfaces declarativas como Jetpack Compose o SwiftUI, evitando lógica de negocio.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 ViewModel (Estado y Lógica)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Elemento pivotal que transforma datos del Modelo para la View. Gestiona estados (carga, éxito, error), coordina operaciones asincrónicas y realiza validaciones de UI. Funciona como un adaptador que aísla la lógica de presentación, haciéndola reutilizable y testable.</p>
        </div>

    </div>

    <div class="highlight-box" style="margin-top: 2rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 8px;">
        <h4 style="color: var(--text-main);">📊 Beneficio Estructural</h4>
        <p>Facilita la colaboración en equipos multidisciplinarios: especialistas en UI para la View, lógica para el ViewModel y backend para el Model, permitiendo desarrollo paralelo sin conflictos.</p>
    </div>
    '
);

-- 4.3 Data Binding y Observabilidad
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    4, 
    '4.3 Data Binding y Observabilidad', 
    '
    <h4 style="color: var(--accent-blue);">🔹 Observabilidad</h4>
    <p>Basada en el <strong>Patrón Observer</strong>, permite que el ViewModel emita notificaciones automáticas a sus suscriptores (la View) ante cambios de estado. Esto elimina actualizaciones manuales y asegura sincronización en tiempo real usando mecanismos como <em>LiveData</em> o <em>StateFlow</em>.</p>

    <h4 style="color: var(--accent-purple); margin-top: 1.5rem;">🔹 Estados en MVVM</h4>
    <p>Las arquitecturas modernas incorporan estados explícitos en el ViewModel:</p>
    <ul style="margin-left: 1.5rem; color: #ccc; display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
        <li>⏳ <strong>Idle:</strong> Inactivo/Inicial.</li>
        <li>🔄 <strong>Loading:</strong> Cargando con progreso.</li>
        <li>✅ <strong>Success:</strong> Datos listos para renderizar.</li>
        <li>❌ <strong>Error:</strong> Mensaje de fallo o reintento.</li>
    </ul>
    <p>La View reacciona a estos estados, esencial para operaciones asincrónicas como llamadas a API o bases de datos, garantizando una UX fluida.</p>

    <h4 style="color: var(--accent-blue); margin-top: 1.5rem;">🔹 Integración con Programación Reactiva</h4>
    <p>MVVM se acopla con paradigmas reactivos (RxJava, Kotlin Flows), manejando flujos de datos continuos y eventos asincrónicos. Ideal para apps con actualizaciones en vivo o IoT, evitando estados mutables y reduciendo bugs de concurrencia.</p>

    <div class="highlight-box" style="border-left: 4px solid var(--accent-green); background: rgba(0, 255, 0, 0.05); padding: 1rem; margin-top: 1rem;">
        <strong>📈 Métricas Técnicas:</strong> Enfoques reactivos reducen inconsistencias de estado, aumentan la cobertura de pruebas unitarias y minimizan dependencias cíclicas.
    </div>
    '
);

-- 4.4 Implementación y Flujo
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    4, 
    '4.4 Implementación de MVVM en aplicaciones móviles', 
    '
    <p>El flujo típico en MVVM sigue una secuencia reactiva:</p>
    
    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1rem;">
        <ol style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;"><strong>Captura:</strong> La Vista captura un evento del usuario y lo envía al ViewModel.</li>
            <li style="margin-bottom: 1rem;"><strong>Procesamiento:</strong> El ViewModel interactúa con el Modelo para procesar la lógica de negocio.</li>
            <li style="margin-bottom: 1rem;"><strong>Estado:</strong> El ViewModel actualiza su estado interno (State).</li>
            <li style="margin-bottom: 1rem;"><strong>Reacción:</strong> La Vista, suscrita al estado, se actualiza automáticamente.</li>
        </ol>
    </div>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">🔹 Arquitectura basada en estado</h4>
    <p>Con el ViewModel como "custodio central", la Vista solo renderiza el estado actual. Esto simplifica la depuración (logs de estado), el testing (mocks de estados) y el análisis de errores en producción.</p>

    <h4 style="color: var(--accent-blue); margin-top: 1.5rem;">🔹 Comparación con MVC</h4>
    <p>Mientras MVC puede llevar a controladores monolíticos y vistas con lógica, MVVM centraliza el estado y organiza componentes de forma predictiva, alineándose con necesidades de escalabilidad y mantenimiento prolongado.</p>
    '
);

-- 4.5 Tabla de Ventajas y Desventajas (ChatGPT)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    4, 
    '4.5 Análisis de Costos y Evaluación de MVVM', 
    '
    <p>Análisis detallado de costos, implementación y evaluación del modelo MVVM.</p>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Cuándo es Ventaja (y por qué)</th>
                    <th style="padding: 15px; text-align: left; width: 40%;">❌ Cuándo es Desventaja (y por qué)</th>
                </tr>
            </thead>
            <tbody>
                <!-- Fila 1 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial de implementación</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Mejor organización desde el inicio mediante separación entre Vista, Modelo y ViewModel. Reduce errores futuros.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mayor costo inicial en tiempo y aprendizaje debido al uso de data binding, observables y arquitectura más compleja.
                    </td>
                </tr>
                <!-- Fila 2 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Infraestructura y herramientas</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Compatible con herramientas modernas gratuitas como Android Studio y frameworks de UI reactiva.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede requerir librerías adicionales o mayor configuración técnica, aumentando la complejidad inicial.
                    </td>
                </tr>
                <!-- Fila 3 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Automatiza la actualización de la interfaz mediante enlace de datos (Data Binding), reduciendo código repetitivo.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Implementación inicial más lenta comparada con MVC debido a la configuración del ViewModel y observadores.
                    </td>
                </tr>
                <!-- Fila 4 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Alta escalabilidad gracias al bajo acoplamiento entre interfaz y lógica de presentación. Ideal para aplicaciones grandes.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede resultar innecesariamente complejo en aplicaciones pequeñas o prototipos simples.
                    </td>
                </tr>
                <!-- Fila 5 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento a largo plazo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Facilita modificaciones sin afectar otras capas del sistema, reduciendo costos de mantenimiento.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Si no se estructura correctamente, el ViewModel puede crecer demasiado y volverse difícil de gestionar.
                    </td>
                </tr>
                <!-- Fila 6 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Gran ventaja:</strong> el ViewModel puede probarse sin depender de la interfaz gráfica, mejorando la calidad del software.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Requiere conocimientos adicionales para configurar pruebas reactivas o asincrónicas.
                    </td>
                </tr>
                <!-- Fila 7 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Comparación con MVC</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Reduce el acoplamiento y mejora actualización automática de la UI, disminuyendo mantenimiento futuro.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        MVC es más simple y rápido de implementar en proyectos pequeños.
                    </td>
                </tr>
                <!-- Fila 8 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Comparación con MVP</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Menor cantidad de interfaces que MVP y mejor integración con interfaces reactivas modernas.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        MVP puede ser más fácil de comprender para equipos sin experiencia en programación reactiva.
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    '
);

USE mobile_architectures;

-- 1. Limpiar subtemas existentes del Tema 5 (MVI)
DELETE FROM subtemas WHERE tema_id = 5;

-- 2. Insertar nuevo contenido para el Tema 5 (MVI)

-- 5.1 Definición de MVI
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    5, 
    '5.1 Definición de MVI', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición Ampliada y Fundamentada</h4>
        <p>La arquitectura <strong>MVI (Model–View–Intent)</strong> es un patrón arquitectónico centrado en el manejo explícito de <strong>estados inmutables</strong> y en un <strong>flujo unidireccional de datos</strong>, donde las acciones del usuario se representan como <em>intents</em> (intenciones) que desencadenan transiciones controladas.</p>
    </div>

    <p>MVI emerge como una evolución influenciada por arquitecturas reactivas (Redux, Elm Architecture) y principios de programación funcional. Este enfoque transforma la aplicación en una entidad predecible, ideal para entornos donde la depuración y la reproducibilidad son críticas.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">📌 Definición Técnica</h4>
    <p>La aplicación se conceptualiza como una <strong>máquina de estados finita</strong>. El estado es único, inmutable y encapsula toda la información de la UI. Los cambios solo se producen mediante <em>Intents</em> procesados por un <em>Reducer</em>, generando un nuevo estado completo sin alterar el anterior. El objetivo es garantizar previsibilidad absoluta y trazabilidad total.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">🎯 Fundamento Conceptual</h4>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>Estado Inmutable:</strong> Evita side effects inesperados y race conditions.</li>
        <li><strong>Funciones Puras:</strong> Reducción de efectos secundarios; solo dependen de inputs.</li>
        <li><strong>Flujo Unidireccional:</strong> Simplifica el razonamiento y elimina dependencias cíclicas.</li>
        <li><strong>Arquitectura Declarativa:</strong> La UI se describe en términos de estado actual.</li>
    </ul>

    <p style="margin-top: 1rem;">Adoptado en Android (Orbit, MVI-Kotlin), iOS (Combine, SwiftUI) y multiplataforma (Flutter, React Native). Es esencial en apps complejas como banca digital o redes sociales para asegurar consistencia y auditabilidad.</p>
    '
);

-- 5.2 Componentes de MVI
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    5, 
    '5.2 Componentes de MVI', 
    '
    <p>En MVI, los componentes priorizan la inmutabilidad y la pureza funcional para un control estricto del comportamiento.</p>

    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 Model (Estado)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Encarna el estado completo e inmutable de la UI (datos, flags de carga, errores). Ejemplo: <code>data class UiState(...)</code>. Cada cambio crea un nuevo estado completo, preservando la historia y facilitando auditorías.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 View (Renderizado)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Renderiza el estado actual de forma declarativa y envía <em>Intents</em>. Es pasiva y reactiva, ideal para frameworks como Compose o SwiftUI que se recomponen basados en diffs de estado.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 Intent (Intención)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Representa la intención del usuario o evento del sistema (ej. <code>LoadData</code>, <code>SubmitForm</code>). Son comandos inmutables que no alteran el estado directamente, sino que se procesan centralizadamente.</p>
        </div>
        
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #ff00ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 Reducer (Procesador)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Función pura que recibe el estado actual y un intent, y computa el nuevo estado. Asegura que la lógica sea testable y predecible, manejando transiciones de forma determinista.</p>
        </div>

    </div>
    
    <div class="highlight-box" style="margin-top: 2rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 8px;">
        <strong>📊 Estructura Resumida:</strong> Intent → Reducer → Nuevo Estado → Vista. Los efectos secundarios (API calls) se manejan en canales separados para mantener la pureza.
    </div>
    '
);

-- 5.3 Flujo Unidireccional
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    5, 
    '5.3 Flujo Unidireccional de Datos', 
    '
    <p>Una característica central de MVI es el flujo unidireccional (UDF), que impone una dirección estricta para eliminar ambigüedades.</p>

    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
        <h4 style="color: var(--accent-purple); margin-bottom: 1rem;">🔄 Ciclo de Flujo Típico:</h4>
        <ol style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;"><strong>Intent:</strong> El usuario genera una acción desde la View.</li>
            <li style="margin-bottom: 1rem;"><strong>Procesamiento:</strong> El Intent llega al Reducer (lógica sincrónica/asincrónica).</li>
            <li style="margin-bottom: 1rem;"><strong>Nuevo Estado:</strong> Se produce un estado inmutable basado en el resultado.</li>
            <li style="margin-bottom: 1rem;"><strong>Renderizado:</strong> La View se actualiza automáticamente con el nuevo estado.</li>
        </ol>
    </div>

    <h4 style="color: var(--accent-blue); margin-top: 2rem;">🔹 Ventajas del Flujo Unidireccional</h4>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>Depuración:</strong> Permite rastrear cada intent a su estado resultante (linealidad).</li>
        <li><strong>Sin Efectos Colaterales:</strong> Mutaciones confinadas a funciones puras.</li>
        <li><strong>Consistencia:</strong> Evita inconsistencias en entornos concurrentes.</li>
    </ul>

    <h4 style="color: var(--accent-purple); margin-top: 1.5rem;">🔹 Comparación con MVVM</h4>
    <p>A diferencia de MVVM que puede tener múltiples estados dispersos, MVI mantiene un <strong>único estado centralizado</strong>, promoviendo una arquitectura más estricta alineada con principios funcionales.</p>
    '
);

-- 5.4 Manejo de Estados
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    5, 
    '5.4 Manejo de Estados', 
    '
    <p>En MVI, el estado es explícito, completo e inmutable. No existen estados implícitos; toda la información se consolida en una estructura única visible y auditable.</p>

    <h4 style="color: var(--accent-blue); margin-top: 1.5rem;">🔹 Beneficios Técnicos</h4>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>Reproducibilidad:</strong> Fácil recreación de errores mediante secuencias de intents.</li>
        <li><strong>Time-Travel Debugging:</strong> Posible en frameworks compatibles.</li>
        <li><strong>Estabilidad:</strong> Reducción de condiciones de carrera mediante inmutabilidad estricta.</li>
    </ul>

    <h4 style="color: var(--accent-purple); margin-top: 1.5rem;">🔹 Estados Comunes</h4>
    <ul style="margin-left: 1.5rem; color: #ccc; display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
        <li>⏳ <strong>Idle:</strong> Inicialización.</li>
        <li>🔄 <strong>Loading:</strong> Progreso parcial.</li>
        <li>✅ <strong>Success:</strong> Datos validados.</li>
        <li>❌ <strong>Error:</strong> Detalles recuperables.</li>
        <li>🚫 <strong>Empty:</strong> Sin datos.</li>
    </ul>

    <div class="highlight-box" style="border-left: 4px solid var(--accent-green); background: rgba(0, 255, 0, 0.05); padding: 1rem; margin-top: 1rem;">
        <strong>📈 Impacto Práctico:</strong> Minimiza errores críticos en apps transaccionales (banca), facilita el testing con mocks puros y mejora el rendimiento con re-renders optimizados.
    </div>
    '
);

-- 5.5 Tabla de Ventajas y Desventajas (ChatGPT)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    5, 
    '5.5 Ventajas y Desventajas de MVI', 
    '
    <p>Análisis detallado de costos, implementación y evaluación de la arquitectura MVI.</p>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Cuándo es Ventaja (y por qué)</th>
                    <th style="padding: 15px; text-align: left; width: 40%;">❌ Cuándo es Desventaja (y por qué)</th>
                </tr>
            </thead>
            <tbody>
                <!-- Fila 1 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial de implementación</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Proporciona una estructura muy organizada basada en flujo unidireccional de datos, reduciendo errores desde el inicio.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Alto costo inicial en tiempo y aprendizaje debido a su complejidad conceptual y configuración arquitectónica.
                    </td>
                </tr>
                <!-- Fila 2 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Infraestructura y herramientas</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Funciona muy bien con tecnologías modernas reactivas y manejo de estados, mejorando estabilidad del sistema.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede requerir librerías reactivas adicionales y mayor conocimiento técnico del equipo.
                    </td>
                </tr>
                <!-- Fila 3 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Reduce errores de sincronización de interfaz gracias al manejo centralizado del estado.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Desarrollo inicial más lento por la implementación de estados, intents y reducers.
                    </td>
                </tr>
                <!-- Fila 4 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Muy alta escalabilidad. Ideal para aplicaciones grandes y sistemas complejos con múltiples estados de interfaz.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede ser excesivo para aplicaciones pequeñas o medianas donde la complejidad no es necesaria.
                    </td>
                </tr>
                <!-- Fila 5 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento a largo plazo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Facilita el mantenimiento al tener un único estado de la aplicación y flujo predecible de datos.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mayor cantidad de código y estructura puede dificultar comprensión para equipos sin experiencia.
                    </td>
                </tr>
                <!-- Fila 6 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Excelente para pruebas unitarias debido a su flujo determinístico y controlado.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Requiere conocimientos avanzados para probar flujos reactivos y manejo de estados.
                    </td>
                </tr>
                <!-- Fila 7 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Comparación con MVVM</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Mayor control del estado y comportamiento predecible de la UI. Reduce errores de inconsistencia visual.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        MVVM es más sencillo de implementar y requiere menor curva de aprendizaje.
                    </td>
                </tr>
                <!-- Fila 8 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Comparación con MVC y MVP</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Minimiza el acoplamiento y evita problemas de lógica distribuida entre componentes.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mucho más complejo que MVC o MVP para proyectos simples.
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    '
);

USE mobile_architectures;

-- 1. Limpiar subtemas existentes del Tema 6 (Clean Architecture)
DELETE FROM subtemas WHERE tema_id = 6;

-- 2. Insertar nuevo contenido para el Tema 6 (Clean Architecture)

-- 6.1 Definición de Clean Architecture
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    6, 
    '6.1 Definición de Clean Architecture', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición Ampliada y Fundamentada</h4>
        <p><strong>Clean Architecture</strong> es un enfoque arquitectónico propuesto por Robert C. Martin (Uncle Bob) que organiza el software en <strong>capas concéntricas</strong>, priorizando la independencia del dominio respecto a frameworks, bases de datos y detalles de implementación.</p>
    </div>

    <p>Su principio central establece que las <strong>reglas de negocio no deben depender de detalles externos</strong>; en cambio, los detalles deben depender del dominio, invirtiendo el flujo tradicional de dependencias. Este patrón se inspira en la Separación de Responsabilidades (SoC) y el Principio de Inversión de Dependencias (DIP), creando un núcleo de negocio puro que permanece estable ante cambios tecnológicos.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">📌 Fundamento Teórico</h4>
    <p>Las capas funcionan como círculos concéntricos: el centro alberga las entidades esenciales, rodeado por capas que agregan funcionalidad pero dependen hacia adentro. Esto asegura que el dominio dicte las abstracciones, facilitando la portabilidad entre plataformas (Android/iOS/Web) y mitigando la deuda técnica causada por actualizaciones de SDKs.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">📊 Nivel de Adopción Actual</h4>
    <p>Ampliamente recomendada en guías oficiales de Android (junto a MVVM) y en iOS para apps modulares. Se aplica en proyectos de gran escala como apps bancarias, e-commerce y salud, facilitando la migración de tecnologías (ej. cambiar de base de datos) sin refactorizar el dominio y optimizando el trabajo en equipos especializados.</p>
    '
);

-- 6.2 Capas de Clean Architecture
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    6, 
    '6.2 Capas de Clean Architecture', 
    '
    <p>Las capas forman una estructura jerárquica donde las dependencias fluyen estrictamente hacia el interior, asegurando que el núcleo permanezca independiente.</p>

    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #ffcc00;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 Entidades (Entities)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Capa central. Contiene reglas de negocio fundamentales y objetos de dominio (ej. Usuario, Transacción). Son independientes de frameworks y reutilizables en cualquier contexto.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #ff6666;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 Casos de Uso (Use Cases)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Lógica de aplicación específica (ej. "RegistrarUsuario"). Coordinan el flujo de datos entre entidades y capas externas, orquestando operaciones atómicas.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #66cc66;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 Adaptadores de Interfaz</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Transforman datos entre el dominio y el exterior. Incluye Presenters/ViewModels, controladores de API y gateways de bases de datos.</p>
        </div>
        
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #3399ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 Frameworks y Drivers</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Capa externa con detalles concretos: UI (Activity/View), Bases de Datos (Room/Realm), APIs (Retrofit) y servicios cloud. Son "detalles" reemplazables.</p>
        </div>

    </div>
    
    <div class="highlight-box" style="margin-top: 2rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 8px;">
        <strong>📊 Beneficio Estructural:</strong> Permite desarrollo paralelo y optimiza flujos en proyectos multiplataforma, reduciendo el impacto de cambios en bibliotecas externas.
    </div>
    '
);

-- 6.3 Principio de Inversión de Dependencias
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    6, 
    '6.3 Principio de Inversión de Dependencias (DIP)', 
    '
    <h4 style="color: var(--accent-blue);">Definición Arquitectónica</h4>
    <p>El <strong>Principio de Inversión de Dependencias (DIP)</strong> establece que los módulos de alto nivel no deben depender de los de bajo nivel; ambos deben depender de <strong>abstracciones</strong>. En Clean Architecture, esto significa que las capas externas (UI, DB) dependen del dominio, invirtiendo el control tradicional.</p>

    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
        <h4 style="color: var(--accent-purple); margin-bottom: 1rem;">⚙️ Mecanismo de Inversión:</h4>
        <ul style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;"><strong>Abstracciones en el Dominio:</strong> Se definen interfaces (ej. <code>UserRepository</code>) en la capa interna.</li>
            <li style="margin-bottom: 1rem;"><strong>Implementaciones Externas:</strong> Las capas externas implementan estas interfaces (ej. <code>SqlUserRepository</code>).</li>
            <li style="margin-bottom: 1rem;"><strong>Inyección de Dependencias:</strong> Frameworks como Dagger o Hilt resuelven estas dependencias en tiempo de ejecución.</li>
        </ul>
    </div>

    <p style="margin-top: 1rem;">Esto permite <strong>desacoplamiento total</strong>, facilitando la sustitución de frameworks (ej. cambiar de Firebase a Supabase) y el testing con mocks, simulando escenarios sin depender de servicios reales.</p>
    '
);

-- 6.4 Integración con MVVM/MVP
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    6, 
    '6.4 Integración con MVVM/MVP', 
    '
    <p>Clean Architecture no reemplaza a patrones como MVVM o MVP, sino que los <strong>complementa</strong>. Mientras Clean Architecture organiza las capas estructurales globales, MVVM/MVP gestionan la interacción específica de la capa de presentación.</p>

    <h4 style="color: var(--accent-blue); margin-top: 1.5rem;">🔹 Cómo se integran:</h4>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>Dominio:</strong> Contiene Entidades y Casos de Uso (independientes de la UI).</li>
        <li><strong>Capa de Adaptadores (Presentación):</strong> Aquí residen los ViewModels (MVVM) o Presenters (MVP).</li>
        <li><strong>Flujo:</strong> El ViewModel/Presenter invoca Casos de Uso, recibe datos del dominio y actualiza la Vista (Activity/SwiftUI).</li>
    </ul>

    <div class="highlight-box" style="border-left: 4px solid var(--accent-green); background: rgba(0, 255, 0, 0.05); padding: 1rem; margin-top: 1rem;">
        <strong>En la práctica:</strong> En Android, un ViewModel consume un Caso de Uso (ej. <code>GetUsersUseCase</code>) y expone el resultado vía <code>StateFlow</code> a la UI. En iOS, un ViewModel consume el Caso de Uso y publica cambios en propiedades <code>@Published</code> para SwiftUI.
    </div>
    '
);

-- 6.5 Tabla de Ventajas y Desventajas (ChatGPT)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    6, 
    '6.5 Ventajas y Desventajas de Clean Architecture', 
    '
    <p>Análisis detallado de costos, implementación y evaluación de Clean Architecture en aplicaciones móviles.</p>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Cuándo es Ventaja (y por qué)</th>
                    <th style="padding: 15px; text-align: left; width: 40%;">❌ Cuándo es Desventaja (y por qué)</th>
                </tr>
            </thead>
            <tbody>
                <!-- Fila 1 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial de implementación</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Permite una estructura altamente organizada desde el inicio, reduciendo errores futuros y facilitando el crecimiento del sistema.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Alto costo inicial en tiempo, diseño y planificación debido a la gran cantidad de capas y reglas arquitectónicas.
                    </td>
                </tr>
                <!-- Fila 2 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Infraestructura y herramientas</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Independiente de frameworks o tecnologías, permitiendo cambiar herramientas sin afectar la lógica principal.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Requiere mayor configuración del proyecto y conocimiento avanzado del equipo de desarrollo.
                    </td>
                </tr>
                <!-- Fila 3 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Disminuye retrabajo en proyectos grandes gracias a la clara separación entre capas (dominio, datos y presentación).
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Desarrollo inicial más lento por la implementación de múltiples módulos y dependencias.
                    </td>
                </tr>
                <!-- Fila 4 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Muy alta escalabilidad. Ideal para aplicaciones empresariales o proyectos de larga duración.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede resultar excesiva para aplicaciones pequeñas o prototipos rápidos.
                    </td>
                </tr>
                <!-- Fila 5 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento a largo plazo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Gran ventaja: facilita modificaciones sin afectar todo el sistema, reduciendo costos de mantenimiento.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mayor complejidad estructural puede dificultar comprensión para desarrolladores sin experiencia.
                    </td>
                </tr>
                <!-- Fila 6 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Excelente soporte para pruebas unitarias al aislar completamente la lógica de negocio.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Configurar pruebas puede requerir mayor preparación técnica inicial.
                    </td>
                </tr>
                <!-- Fila 7 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Comparación con MVC, MVP y MVVM</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Mejor separación de responsabilidades y menor dependencia tecnológica, aumentando estabilidad del proyecto.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mucho más compleja y costosa de implementar que MVC, MVP o MVVM en proyectos simples.
                    </td>
                </tr>
                <!-- Fila 8 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Comparación con MVI</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Más flexible tecnológicamente y aplicable a distintos patrones de presentación.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        MVI puede ser más directo para manejo específico de estados en interfaces reactivas.
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    '
);

USE mobile_architectures;

-- 1. Limpiar subtemas existentes del Tema 7 (Arquitectura en Capas)
DELETE FROM subtemas WHERE tema_id = 7;

-- 2. Insertar nuevo contenido para el Tema 7 (Layered Architecture)

-- 7.1 Definición
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    7, 
    '7.1 Definición de Arquitectura en Capas', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición Ampliada y Fundamentada</h4>
        <p>La <strong>Arquitectura Basada en Capas (Layered Architecture)</strong> es un estilo arquitectónico que organiza una aplicación en niveles jerárquicos, donde cada capa tiene responsabilidades específicas y solo interactúa con la capa inmediatamente inferior o superior.</p>
    </div>

    <p>Promueve un flujo controlado de datos y comandos para evitar dependencias cruzadas. Es uno de los estilos más antiguos y utilizados en ingeniería de software, derivado de principios establecidos en sistemas mainframe y evolucionado hacia arquitecturas modernas como microservicios.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">📌 Definición Técnica</h4>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>Separación de Responsabilidades (SoC):</strong> Asigna funciones únicas a cada nivel.</li>
        <li><strong>Encapsulamiento Funcional:</strong> Oculta implementaciones internas y protege la integridad.</li>
        <li><strong>Desacoplamiento Estructural:</strong> Minimiza impactos de cambios mediante interfaces o contratos.</li>
    </ul>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">🎯 Objetivo Principal</h4>
    <p>Mejorar la organización estructural, facilitar el mantenimiento mediante actualizaciones localizadas, permitir escalabilidad horizontal/vertical y reducir el acoplamiento forzando dependencias unidireccionales.</p>
    '
);

-- 7.2 Capas Típicas
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    7, 
    '7.2 Capas Típicas en Aplicaciones Móviles', 
    '
    <p>Aunque varía según la complejidad, en aplicaciones móviles modernas (Android con Jetpack, iOS con SwiftUI) suelen existir las siguientes capas:</p>

    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 1. Capa de Presentación</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Responsable de la UI, interacción con el usuario (gestures, inputs) y renderización. Ejemplos: Activities/Fragments, SwiftUI Views. No debe contener lógica de negocio compleja.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 2. Capa de Lógica de Negocio</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Reglas del sistema, workflows, validaciones y algoritmos. Orquesta operaciones como autenticación. Utiliza patrones como Command o Strategy.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 3. Capa de Datos</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Acceso a DB locales (Room, Core Data), comunicación con APIs (Retrofit, URLSession) y persistencia. Encapsula detalles técnicos de almacenamiento.</p>
        </div>
        
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #808080;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 4. Capa de Infraestructura (Opcional)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Seguridad, conectividad, push notifications, analytics y configuración del sistema (Dependency Injection). Envoltura para cross-cutting concerns.</p>
        </div>

    </div>

    <div class="highlight-box" style="margin-top: 2rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 8px;">
        <strong>📌 Flujo Típico:</strong> Ascendente (Presentación → Lógica → Datos) para requests; Descendente (Datos → Lógica → Presentación) para responses.
    </div>
    '
);

-- 7.3 Relación con Otras Arquitecturas
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    7, 
    '7.3 Relación con Otras Arquitecturas', 
    '
    <p>La arquitectura en capas es una <strong>base estructural</strong> sobre la cual se implementan patrones como MVC, MVP, MVVM y MVI.</p>

    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
        <ul style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;">
                <strong>Relación con MVC:</strong> La Presentación se alinea con Vista+Controlador; Lógica con Modelo; Datos con Persistencia. El controlador actúa como puente.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Relación con MVVM:</strong> Presentación es View; Lógica de Presentación es ViewModel; Dominio/Datos es Model. MVVM es una especialización dentro de las capas.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Relación con MVI:</strong> Capa de Estado (Modelo), Capa de Renderizado (Vista), Capa de Procesamiento (Reducer). Soporta flujos unidireccionales respetando la jerarquía.
            </li>
        </ul>
    </div>

    <p style="margin-top: 1rem;">No compite con estos patrones, sino que actúa como un nivel más general que los envuelve para asegurar consistencia y facilitar refactoring progresivo.</p>
    '
);

-- 7.4 Tabla de Ventajas y Desventajas (ChatGPT)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    7, 
    '7.4 Ventajas y Desventajas de la Arquitectura en Capas', 
    '
    <p>Análisis detallado de costos, implementación y evaluación de la Arquitectura Basada en Capas en aplicaciones móviles.</p>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Cuándo es Ventaja (y por qué)</th>
                    <th style="padding: 15px; text-align: left; width: 40%;">❌ Cuándo es Desventaja (y por qué)</th>
                </tr>
            </thead>
            <tbody>
                <!-- Fila 1 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial de implementación</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Bajo a moderado. Su estructura por capas (presentación, lógica y datos) es fácil de entender e implementar.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede requerir reorganización posterior si la aplicación crece y necesita mayor independencia entre módulos.
                    </td>
                </tr>
                <!-- Fila 2 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Infraestructura y herramientas</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Compatible con cualquier tecnología o framework móvil sin requerir herramientas especiales.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        No impone reglas estrictas, lo que puede generar malas prácticas si no se controla la comunicación entre capas.
                    </td>
                </tr>
                <!-- Fila 3 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Desarrollo rápido gracias a su estructura clara y tradicional.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede aumentar el tiempo cuando existen muchas dependencias entre capas.
                    </td>
                </tr>
                <!-- Fila 4 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Funciona bien en aplicaciones pequeñas y medianas con flujo de trabajo definido.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Escalabilidad limitada en sistemas complejos debido al acoplamiento entre capas.
                    </td>
                </tr>
                <!-- Fila 5 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento a largo plazo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Facilita localizar errores al estar el sistema dividido por responsabilidades.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Cambios en una capa pueden afectar otras si no existe buena separación, aumentando costos de mantenimiento.
                    </td>
                </tr>
                <!-- Fila 6 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Permite pruebas por capa (datos, lógica o presentación).
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Las dependencias entre capas pueden dificultar pruebas completamente independientes.
                    </td>
                </tr>
                <!-- Fila 7 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Comparación con MVC/MVP</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Más general y flexible, sirve como base para otros patrones arquitectónicos.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        MVC o MVP ofrecen roles más definidos para interfaces de usuario.
                    </td>
                </tr>
                <!-- Fila 8 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Comparación con Clean Architecture</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Más sencilla y rápida de implementar.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Clean Architecture ofrece mejor independencia y escalabilidad en proyectos grandes.
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    '
);

USE mobile_architectures;

-- 1. Limpiar subtemas existentes del Tema 8 (Comparación)
DELETE FROM subtemas WHERE tema_id = 8;

-- 2. Insertar nuevo contenido para el Tema 8 (Comparativa)

-- 8.1 Criterios de comparación
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    8, 
    '8.1 Criterios de Comparación', 
    '
    <p>Para evaluar objetivamente las arquitecturas móviles, establecemos los siguientes criterios fundamentales:</p>
    
    <div class="criteria-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem; margin-top: 1rem;">
        <div class="criteria-card" style="background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 8px;">
            <h4 style="color: var(--accent-blue);">📉 Curva de Aprendizaje</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Dificultad inicial para el equipo.</p>
        </div>
        <div class="criteria-card" style="background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 8px;">
            <h4 style="color: var(--accent-purple);">🧪 Testabilidad</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Facilidad para escribir pruebas unitarias.</p>
        </div>
        <div class="criteria-card" style="background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 8px;">
            <h4 style="color: #00ff00);">🚀 Escalabilidad</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Capacidad de crecer sin deuda técnica.</p>
        </div>
        <div class="criteria-card" style="background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 8px;">
            <h4 style="color: #ffcc00);">💰 Costo Inicial</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Tiempo y esfuerzo para configurar el proyecto.</p>
        </div>
    </div>
    '
);

-- 8.2 Comparación Interactiva
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    8, 
    '8.2 Comparativa Visual: MVC vs MVP vs MVVM vs MVI', 
    '
    <p>A continuación se presentan gráficos interactivos que comparan el rendimiento de cada arquitectura en aspectos clave.</p>

    <!-- Canvas para gráficos -->
    <div class="charts-container" style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin-top: 2rem;">
        <div class="chart-box" style="background: #111; padding: 1rem; border-radius: 12px; border: 1px solid #333;">
            <h4 style="text-align: center; margin-bottom: 1rem;">Nivel de Testabilidad</h4>
            <canvas id="testabilityChart"></canvas>
        </div>
        <div class="chart-box" style="background: #111; padding: 1rem; border-radius: 12px; border: 1px solid #333;">
            <h4 style="text-align: center; margin-bottom: 1rem;">Curva de Aprendizaje (Complejidad)</h4>
            <canvas id="complexityChart"></canvas>
        </div>
    </div>

    <div class="chart-box" style="background: #111; padding: 1rem; border-radius: 12px; border: 1px solid #333; margin-top: 2rem;">
        <h4 style="text-align: center; margin-bottom: 1rem;">Comparativa General (Radar)</h4>
        <div style="max-width: 600px; margin: 0 auto;">
            <canvas id="radarChart"></canvas>
        </div>
    </div>

    <!-- Script para cargar Chart.js y renderizar -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Configuración común
            Chart.defaults.color = "#ccc";
            Chart.defaults.borderColor = "#333";

            // Gráfico de Testabilidad (Bar)
            new Chart(document.getElementById("testabilityChart"), {
                type: "bar",
                data: {
                    labels: ["MVC", "MVP", "MVVM", "MVI", "Clean Arch"],
                    datasets: [{
                        label: "Nivel de Testabilidad (1-10)",
                        data: [3, 8, 9, 9.5, 10],
                        backgroundColor: [
                            "rgba(255, 99, 132, 0.6)",
                            "rgba(54, 162, 235, 0.6)",
                            "rgba(255, 206, 86, 0.6)",
                            "rgba(75, 192, 192, 0.6)",
                            "rgba(153, 102, 255, 0.6)"
                        ],
                        borderColor: [
                            "rgba(255, 99, 132, 1)",
                            "rgba(54, 162, 235, 1)",
                            "rgba(255, 206, 86, 1)",
                            "rgba(75, 192, 192, 1)",
                            "rgba(153, 102, 255, 1)"
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: { y: { beginAtZero: true, max: 10 } },
                    animation: { duration: 2000, easing: "easeOutBounce" }
                }
            });

            // Gráfico de Complejidad (Doughnut)
            new Chart(document.getElementById("complexityChart"), {
                type: "doughnut",
                data: {
                    labels: ["MVC (Baja)", "MVP (Media)", "MVVM (Media-Alta)", "MVI (Alta)", "Clean Arch (Muy Alta)"],
                    datasets: [{
                        data: [20, 40, 60, 80, 100],
                        backgroundColor: [
                            "#4ade80", "#60a5fa", "#facc15", "#f472b6", "#a78bfa"
                        ],
                        hoverOffset: 20
                    }]
                },
                options: {
                    cutout: "60%",
                    animation: { animateScale: true }
                }
            });

            // Gráfico de Radar General
            new Chart(document.getElementById("radarChart"), {
                type: "radar",
                data: {
                    labels: ["Escalabilidad", "Mantenibilidad", "Testabilidad", "Facilidad Inicio", "Performance UI"],
                    datasets: [
                        {
                            label: "MVC",
                            data: [3, 3, 3, 9, 7],
                            fill: true,
                            backgroundColor: "rgba(255, 99, 132, 0.2)",
                            borderColor: "rgb(255, 99, 132)",
                            pointBackgroundColor: "rgb(255, 99, 132)",
                        },
                        {
                            label: "MVVM",
                            data: [8, 8, 9, 6, 9],
                            fill: true,
                            backgroundColor: "rgba(54, 162, 235, 0.2)",
                            borderColor: "rgb(54, 162, 235)",
                            pointBackgroundColor: "rgb(54, 162, 235)",
                        },
                        {
                            label: "MVI",
                            data: [9, 9, 9, 4, 8],
                            fill: true,
                            backgroundColor: "rgba(75, 192, 192, 0.2)",
                            borderColor: "rgb(75, 192, 192)",
                            pointBackgroundColor: "rgb(75, 192, 192)",
                        }
                    ]
                },
                options: {
                    elements: { line: { borderWidth: 3 } },
                    scales: { r: { min: 0, max: 10, ticks: { display: false }, grid: { color: "#444" } } }
                }
            });
        });
    </script>
    '
);

-- 8.3 Selección de Arquitectura
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    8, 
    '8.3 Selección de Arquitectura', 
    '
    <p>Elegir la arquitectura correcta depende del contexto del proyecto. No existe una "bala de plata".</p>

    <div class="selection-guide" style="display: flex; flex-direction: column; gap: 1.5rem; margin-top: 2rem;">
        
        <div class="selection-item" style="border-left: 4px solid #4ade80; padding-left: 1rem;">
            <h4 style="color: #4ade80;">✅ Elige MVC si...</h4>
            <p>Estás creando un prototipo rápido, una app muy simple con pocas pantallas, o estás aprendiendo los conceptos básicos de desarrollo.</p>
        </div>

        <div class="selection-item" style="border-left: 4px solid #60a5fa; padding-left: 1rem;">
            <h4 style="color: #60a5fa;">✅ Elige MVP si...</h4>
            <p>Necesitas alta testabilidad en un proyecto legacy o en un equipo que prefiere un estilo imperativo y control explícito sobre la vista.</p>
        </div>

        <div class="selection-item" style="border-left: 4px solid #facc15; padding-left: 1rem;">
            <h4 style="color: #facc15;">✅ Elige MVVM si...</h4>
            <p>Usas frameworks modernos (Android Jetpack, SwiftUI), buscas aprovechar el Data Binding y quieres un equilibrio ideal entre estructura y complejidad.</p>
        </div>

        <div class="selection-item" style="border-left: 4px solid #f472b6; padding-left: 1rem;">
            <h4 style="color: #f472b6;">✅ Elige MVI si...</h4>
            <p>Tu app tiene flujos de datos complejos, actualizaciones en tiempo real, múltiples fuentes de verdad o requiere una trazabilidad absoluta de estados (ej. Apps bancarias).</p>
        </div>

        <div class="selection-item" style="border-left: 4px solid #a78bfa; padding-left: 1rem;">
            <h4 style="color: #a78bfa;">✅ Elige Clean Architecture si...</h4>
            <p>El proyecto es de larga duración (años), empresarial, grande, y requiere independencia total de frameworks y bases de datos. Se suele combinar con MVVM o MVI.</p>
        </div>

    </div>
    '
);

-- 8.4 Tabla de Usos Final
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    8, 
    '8.4 Tabla Final de Usos Recomendados', 
    '
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
                    <td style="padding: 15px;">Juegos, Apps triviales de 1 pantalla</td>
                    <td style="padding: 15px;"><em>Reactividad</em></td>
                </tr>
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">MVI</td>
                    <td style="padding: 15px;">Alta concurrencia, Debugging crítico</td>
                    <td style="padding: 15px;">Equipos Junior, Proyectos con deadline corto</td>
                    <td style="padding: 15px;"><em>Previsibilidad</em></td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Clean Arch</td>
                    <td style="padding: 15px;">Proyectos de +5 años, Multi-módulo</td>
                    <td style="padding: 15px;">Startups en fase de validación (MVP)</td>
                    <td style="padding: 15px;"><em>Independencia</em></td>
                </tr>
            </tbody>
        </table>
    </div>
    '
);

USE mobile_architectures;

-- 1. Create table for Quiz Questions if not exists
CREATE TABLE IF NOT EXISTS `quiz_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_option` char(1) NOT NULL, -- 'A', 'B', 'C', or 'D'
  `explanation` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Clear existing questions to avoid duplicates on re-run
TRUNCATE TABLE `quiz_questions`;

-- 3. Insert Questions (covering topics 1-8)
INSERT INTO `quiz_questions` (`question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `explanation`) VALUES
-- Topic 1: Intro
('¿Cuál es el objetivo principal de una arquitectura de software móvil?', 'Hacer que la app se vea bonita', 'Estructurar el sistema para facilitar mantenimiento y escalabilidad', 'Escribir menos código', 'Usar la última tecnología disponible', 'B', 'La arquitectura busca organizar el código para que sea mantenible, escalable y testable a largo plazo.'),

-- Topic 2: MVC
('En el patrón MVC, ¿qué componente es responsable de la lógica de negocio y los datos?', 'Vista (View)', 'Controlador (Controller)', 'Modelo (Model)', 'Usuario', 'C', 'El Modelo encapsula la lógica de negocio y el estado de la aplicación, independiente de la interfaz.'),
('¿Cuál es una desventaja común del patrón MVC en aplicaciones complejas?', 'Es demasiado difícil de aprender', 'El Controlador tiende a volverse masivo (Massive View Controller)', 'No permite usar bases de datos', 'La Vista no se puede actualizar', 'B', 'En apps grandes, el Controlador asume demasiadas responsabilidades, volviéndose difícil de mantener.'),

-- Topic 3: MVP
('En MVP, ¿cómo se comunican la Vista y el Presentador?', 'Directamente accediendo a variables', 'A través de interfaces (Contratos)', 'Mediante eventos del sistema operativo', 'No se comunican', 'B', 'MVP usa interfaces para desacoplar la Vista del Presentador, facilitando el testing.'),
('¿Qué ventaja principal ofrece MVP sobre MVC para el testing?', 'No requiere escribir tests', 'Permite probar la lógica de presentación sin depender de la UI (Android/iOS)', 'Es más rápido de compilar', 'Usa menos memoria', 'B', 'Al aislar la lógica en el Presentador (POJO), se pueden correr tests unitarios sin emuladores.'),

-- Topic 4: MVVM
('¿Qué componente es clave en MVVM para conectar la Vista y el ViewModel?', 'El Controlador', 'Data Binding u Observables', 'Un archivo XML estático', 'Una base de datos SQL', 'B', 'El Data Binding o los patrones de observación (LiveData, StateFlow) permiten que la Vista reaccione automáticamente a cambios en el ViewModel.'),
('¿Cuál es el rol del ViewModel en MVVM?', 'Dibujar los botones en pantalla', 'Guardar datos en el disco duro', 'Exponer el estado y manejar la lógica de presentación para la Vista', 'Validar transacciones bancarias', 'C', 'El ViewModel transforma los datos del Modelo para que la Vista los consuma y maneja el estado de la UI.'),

-- Topic 5: MVI
('¿Qué característica define al flujo de datos en MVI?', 'Es bidireccional y caótico', 'Es unidireccional y cíclico (Intent -> Model -> View)', 'No hay flujo de datos', 'Depende del usuario', 'B', 'MVI impone un flujo estricto unidireccional donde los Intents generan nuevos estados inmutables.'),
('En MVI, el estado de la aplicación es...', 'Mutable y distribuido', 'Inmutable y centralizado', 'Opcional', 'Guardado solo en la nube', 'B', 'MVI trata el estado como inmutable; cada cambio genera una nueva instancia del estado completo.'),

-- Topic 6: Clean Architecture
('Según Clean Architecture, ¿hacia dónde deben apuntar las dependencias?', 'Hacia afuera (Frameworks)', 'Hacia adentro (Reglas de Negocio/Dominio)', 'Hacia la base de datos', 'Aleatoriamente', 'B', 'La Regla de Dependencia establece que las capas externas dependen de las internas, nunca al revés.'),
('¿Qué capa se encuentra en el centro de Clean Architecture?', 'Presentadores', 'Base de Datos', 'Entidades (Entities)', 'Interfaz de Usuario', 'C', 'Las Entidades encapsulan las reglas de negocio más generales y de alto nivel.'),

-- Topic 7: Layered Architecture
('En una arquitectura por capas típica, la capa de presentación debe comunicarse directamente con...', 'La base de datos', 'La capa de lógica de negocio', 'La capa de infraestructura', 'Servicios externos', 'B', 'Para mantener la separación, la presentación habla con la lógica, y esta con los datos.'),

-- Topic 8: Comparison
('Si tienes un equipo junior y necesitas un prototipo rápido para mañana, ¿qué arquitectura elegirías?', 'Clean Architecture', 'MVI', 'MVC', 'Microservicios', 'C', 'MVC es la más simple y rápida de implementar para proyectos pequeños o prototipos.'),
('¿Qué arquitectura es ideal para una app bancaria que requiere alta trazabilidad y cero errores de estado?', 'MVC', 'MVP', 'MVI', 'No importa', 'C', 'MVI ofrece un control de estado predecible y unidireccional, ideal para apps críticas y complejas.');

-- 4. Insert Topic 9 into 'temas' if not exists (or update)
INSERT INTO `temas` (`id`, `titulo`, `descripcion`) VALUES (9, 'Evaluación de Conocimientos', 'Cuestionario interactivo para poner a prueba lo aprendido sobre arquitecturas móviles.')
ON DUPLICATE KEY UPDATE `titulo`='Evaluación de Conocimientos', `descripcion`='Cuestionario interactivo para poner a prueba lo aprendido sobre arquitecturas móviles.';

-- 5. Insert content for Topic 9 (The Quiz Interface)
DELETE FROM `subtemas` WHERE `tema_id` = 9;
INSERT INTO `subtemas` (`tema_id`, `titulo`, `contenido`) VALUES (
    9,
    '9.1 Cuestionario Final',
    '
    <div id="quiz-container" style="max-width: 800px; margin: 0 auto;">
        <div class="quiz-header" style="text-align: center; margin-bottom: 2rem;">
            <h3 style="color: var(--accent-blue);">🧠 Desafío de Arquitectura</h3>
            <p>Responde las siguientes preguntas para validar tu dominio sobre los patrones.</p>
            <div id="score-display" style="font-size: 1.5rem; font-weight: bold; margin-top: 1rem; display: none;">
                Puntuación: <span id="score-value">0</span> / <span id="total-questions">0</span>
            </div>
        </div>

        <div id="loading-quiz" style="text-align: center; padding: 2rem;">
            <p>Cargando preguntas...</p>
        </div>

        <form id="quiz-form" style="display: none;">
            <!-- Questions will be injected here by JS -->
        </form>

        <div id="quiz-results" style="display: none; text-align: center; margin-top: 2rem;">
            <h2 id="final-message"></h2>
            <button onclick="location.reload()" style="padding: 10px 20px; background: var(--accent-purple); color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 1rem;">Intentar de nuevo</button>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            fetch("api_get_quiz.php")
                .then(response => response.json())
                .then(questions => {
                    const form = document.getElementById("quiz-form");
                    const loading = document.getElementById("loading-quiz");
                    const scoreDisplay = document.getElementById("score-display");
                    const totalSpan = document.getElementById("total-questions");
                    
                    loading.style.display = "none";
                    form.style.display = "block";
                    scoreDisplay.style.display = "block";
                    totalSpan.textContent = questions.length;

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
                            <div class="feedback" id="feedback-${q.id}" style="display: none; margin-top: 1rem; padding: 1rem; border-radius: 5px;"></div>
                        `;
                        form.appendChild(qDiv);

                        // Add change listener for immediate feedback
                        const inputs = qDiv.querySelectorAll("input[type=radio]");
                        inputs.forEach(input => {
                            input.addEventListener("change", function() {
                                const selected = this.value;
                                const feedback = document.getElementById(`feedback-${q.id}`);
                                const isCorrect = selected === q.correct_option;
                                
                                // Disable all inputs for this question
                                inputs.forEach(i => i.disabled = true);

                                if (isCorrect) {
                                    feedback.style.backgroundColor = "rgba(0, 255, 0, 0.2)";
                                    feedback.style.border = "1px solid #00ff00";
                                    feedback.innerHTML = `<strong style="color: #4ade80;">¡Correcto!</strong> ${q.explanation}`;
                                    updateScore(1);
                                } else {
                                    feedback.style.backgroundColor = "rgba(255, 0, 0, 0.2)";
                                    feedback.style.border = "1px solid #ff0000";
                                    feedback.innerHTML = `<strong style="color: #f87171;">Incorrecto.</strong> La respuesta correcta era la opción ${q.correct_option}.<br><br>${q.explanation}`;
                                }
                                feedback.style.display = "block";
                            });
                        });
                    });
                })
                .catch(err => {
                    console.error("Error loading quiz:", err);
                    document.getElementById("loading-quiz").innerHTML = "<p style=\'color: red;\'>Error al cargar el cuestionario.</p>";
                });
        });

        let currentScore = 0;
        function updateScore(points) {
            currentScore += points;
            document.getElementById("score-value").textContent = currentScore;
        }
    </script>
    '
);
