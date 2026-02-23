
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
(1, 'IntroducciÃ³n a las arquitecturas mÃ³viles', 'Conceptos bÃ¡sicos y objetivos de la arquitectura en el desarrollo mÃ³vil.'),
(2, 'Arquitectura MVC (Modelâ€“Viewâ€“Controller)', 'El patrÃ³n clÃ¡sico que separa la aplicaciÃ³n en tres componentes principales.'),
(3, 'Arquitectura MVP (Modelâ€“Viewâ€“Presenter)', 'Una evoluciÃ³n de MVC que busca desacoplar la vista del modelo a travÃ©s de un presentador.'),
(4, 'Arquitectura MVVM (Modelâ€“Viewâ€“ViewModel)', 'Facilita la separaciÃ³n del desarrollo de la interfaz grÃ¡fica del desarrollo de la lÃ³gica de negocio.'),
(5, 'Arquitectura MVI (Modelâ€“Viewâ€“Intent)', 'Un patrÃ³n reactivo y unidireccional inspirado en Cycle.js y Redux.'),
(6, 'Clean Architecture en aplicaciones mÃ³viles', 'Arquitectura propuesta por Uncle Bob para crear sistemas independientes de frameworks y UI.'),
(7, 'Arquitectura en capas (Layered Architecture)', 'OrganizaciÃ³n del cÃ³digo en capas lÃ³gicas como presentaciÃ³n, dominio y datos.'),
(8, 'ComparaciÃ³n de arquitecturas mÃ³viles', 'AnÃ¡lisis comparativo de los diferentes patrones arquitectÃ³nicos.'),
(9, 'EvaluaciÃ³n de Conocimientos', 'Cuestionario interactivo para poner a prueba lo aprendido sobre arquitecturas mÃ³viles.');
-- Update 1.1: DefiniciÃ³n Ampliada
UPDATE subtemas 
SET contenido = '
<div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
    <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">DefiniciÃ³n Formal</h4>
    <p>La arquitectura de software en aplicaciones mÃ³viles se define como la <strong>estructura organizativa del software</strong> de una aplicaciÃ³n mÃ³vil, donde se establecen los componentes principales, sus responsabilidades y las interacciones entre ellos.</p>
</div>

<p>Esencialmente, es un conjunto de <strong>patrones, principios y tÃ©cnicas estructurales</strong> que guÃ­an el diseÃ±o y la implementaciÃ³n del cÃ³digo, asegurando que la aplicaciÃ³n sea eficiente, flexible y adaptable a cambios futuros. De manera mÃ¡s tÃ©cnica, representa las decisiones de diseÃ±o relacionadas con la estructura y el comportamiento global del sistema, compuesta por elementos con propiedades visibles externamente y las relaciones entre ellos.</p>

<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/CleanArchitecture.jpg" alt="Clean Architecture Diagram" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
    <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama de Arquitectura MÃ³vil (Clean Architecture)</p>
</div>

<h4 style="margin-top: 2rem; color: var(--accent-purple);">FunciÃ³n Principal</h4>
<p>Su funciÃ³n principal dentro del desarrollo de aplicaciones mÃ³viles es establecer la base conceptual para construir sistemas escalables y mantenibles. ActÃºa como un "plano" que:</p>

<ul class="feature-list" style="margin-left: 1.5rem; margin-bottom: 2rem; color: #ccc;">
    <li><strong>Simplifica</strong> los procesos de desarrollo.</li>
    <li>Ofrece una <strong>visualizaciÃ³n clara</strong> de los requisitos tÃ©cnicos y funcionales.</li>
    <li>Permite enfrentar <strong>constantes cambios</strong> en el ecosistema mÃ³vil (actualizaciones de SO, nuevos dispositivos o requisitos de usuario).</li>
    <li>Facilita la <strong>integraciÃ³n</strong> con servicios externos como APIs, bases de datos o redes.</li>
</ul>

<p>En plataformas como Android e iOS, la arquitectura es la base para crear apps de alta calidad, adaptables a entornos en expansiÃ³n. Sin una arquitectura bien definida, el desarrollo puede volverse caÃ³tico, con cÃ³digo difÃ­cil de depurar o escalar.</p>

<div class="highlight-box" style="border: 1px dashed var(--accent-blue); padding: 1rem; border-radius: 8px; margin-top: 1rem; background: rgba(0, 198, 255, 0.05);">
    <strong>Resumen:</strong> La arquitectura mÃ³vil no solo organiza el cÃ³digo, sino que alinea el diseÃ±o con factores determinantes como requisitos funcionales (lo que la app debe hacer) y no funcionales (rendimiento, seguridad, usabilidad).
</div>
' 
WHERE tema_id = 1 AND titulo LIKE '1.1%';

-- Update 1.2: Objetivos Fundamentales
UPDATE subtemas 
SET contenido = '
<p>Los objetivos de una arquitectura mÃ³vil se centran en optimizar el desarrollo y el ciclo de vida de la aplicaciÃ³n. A continuaciÃ³n, se detallan los objetivos clave:</p>

<div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ§© OrganizaciÃ³n del CÃ³digo</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Facilita una estructura modular y clara, reduciendo la complejidad y permitiendo que diferentes partes del sistema interactÃºen eficientemente.</p>
    </div>

    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #0072ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ› ï¸ Mantenimiento</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Un diseÃ±o bien estructurado hace que el cÃ³digo sea mÃ¡s limpio, fÃ¡cil de actualizar, corregir errores o agregar funcionalidades sin comprometer la integridad general.</p>
    </div>

    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ“ˆ Escalabilidad</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Asegura que la aplicaciÃ³n pueda crecer, manejando mÃ¡s usuarios, datos o caracterÃ­sticas nuevas, sin necesidad de reescrituras masivas.</p>
    </div>

    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸŽ­ SeparaciÃ³n de Responsabilidades</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Divide el sistema en componentes independientes (como lÃ³gica de negocio, interfaz y datos), cumpliendo con requisitos funcionales y no funcionales.</p>
    </div>
</div>

<h4 style="margin-top: 2rem; color: var(--accent-purple);">Otros Objetivos Clave</h4>
<ul style="margin-left: 1.5rem; margin-bottom: 2rem; color: #ccc;">
    <li><strong>Mejorar la testabilidad:</strong> Facilitando la creaciÃ³n de pruebas unitarias y de integraciÃ³n.</li>
    <li><strong>Promover la reutilizaciÃ³n:</strong> Aprovechar componentes de cÃ³digo en mÃºltiples partes del proyecto o en futuros desarrollos.</li>
    <li><strong>Calidad y rapidez:</strong> Garantizar un software de calidad distribuido rÃ¡pidamente, alineado con metas empresariales.</li>
    <li><strong>Adaptabilidad:</strong> Manejo de conexiones intermitentes, optimizaciÃ³n de baterÃ­a y soporte a diversidad de dispositivos.</li>
</ul>
' 
WHERE tema_id = 1 AND titulo LIKE '1.2%';

-- Insert new subtopics based on the research provided
-- We need to check if these exist first or just insert. Since the user wants to "expand", let's add them as new subtopics for Topic 1 or Topic 8 (Comparison), or maybe create new main topics?
-- The user asked to expand the theme. The provided text has Section 2 "Tipos de Arquitecturas", Section 3 "Principios...", Section 4 "Consideraciones...".
-- Let's map these to the existing structure or add new ones.
-- The existing structure has specific topics for MVC, MVP, MVVM, etc.
-- Let's update the specific topics with the new info if applicable, or add a general "Tipos de Arquitecturas" overview in Topic 1 or 8.
-- The user provided text for "2. Tipos de Arquitecturas..." which is a comparison/overview. This fits well in Topic 8 "ComparaciÃ³n de arquitecturas mÃ³viles".

UPDATE subtemas 
SET contenido = '
<p>Para una investigaciÃ³n completa, analizamos los principales tipos de arquitecturas utilizadas en apps mÃ³viles. Estos patrones resuelven problemas comunes y se eligen segÃºn la complejidad del proyecto, el equipo y las necesidades de escalabilidad.</p>

<div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem;">
    <table style="width: 100%; border-collapse: collapse; min-width: 600px; font-size: 0.9rem;">
        <thead>
            <tr style="background: var(--accent-blue); color: white;">
                <th style="padding: 10px; text-align: left;">PatrÃ³n</th>
                <th style="padding: 10px; text-align: left;">DescripciÃ³n Breve</th>
                <th style="padding: 10px; text-align: left;">Ventajas</th>
                <th style="padding: 10px; text-align: left;">Desventajas</th>
            </tr>
        </thead>
        <tbody>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 10px; font-weight: bold; color: var(--accent-blue);">MVC</td>
                <td style="padding: 10px;">Divide en Modelo, Vista y Controlador.</td>
                <td style="padding: 10px;">FÃ¡cil de entender; separa lÃ³gica de IU.</td>
                <td style="padding: 10px;">Controladores masivos en apps complejas.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                <td style="padding: 10px; font-weight: bold; color: var(--accent-blue);">MVP</td>
                <td style="padding: 10px;">Similar a MVC, Presenter maneja lÃ³gica de presentaciÃ³n.</td>
                <td style="padding: 10px;">Mejor separaciÃ³n; facilita pruebas.</td>
                <td style="padding: 10px;">MÃ¡s cÃ³digo y complejidad.</td>
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
                <td style="padding: 10px;">SeparaciÃ³n estricta; alto mantenimiento.</td>
                <td style="padding: 10px;">Muy complejo; muchos archivos.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 10px; font-weight: bold; color: var(--accent-blue);">Clean Architecture</td>
                <td style="padding: 10px;">Capas concÃ©ntricas independientes.</td>
                <td style="padding: 10px;">Independencia total; testable.</td>
                <td style="padding: 10px;">Curva de aprendizaje alta.</td>
            </tr>
        </tbody>
    </table>
</div>

<h3 style="color: var(--accent-purple); margin-top: 2rem;">Detalles de Patrones Principales</h3>

<div class="pattern-detail" style="margin-bottom: 2rem;">
    <h4 style="color: #fff;">MVC (Model-View-Controller)</h4>
    <p>El patrÃ³n mÃ¡s bÃ¡sico, donde el Controlador actÃºa como cerebro. Ideal para proyectos simples.</p>
    <div style="text-align: center; margin: 1rem 0;">
        <img src="images/MVC3.webp" alt="Diagrama MVC" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
    </div>
</div>

<div class="pattern-detail" style="margin-bottom: 2rem;">
    <h4 style="color: #fff;">MVVM (Model-View-ViewModel)</h4>
    <p>EvoluciÃ³n que enfatiza el data binding. Recomendado por Google para Android.</p>
    <div style="text-align: center; margin: 1rem 0;">
        <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=mvvm%20architecture%20diagram%20mobile%20model%20view%20viewmodel%20binding%20tech&image_size=landscape_16_9" alt="Diagrama MVVM" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
    </div>
</div>

<div class="pattern-detail" style="margin-bottom: 2rem;">
    <h4 style="color: #fff;">Clean Architecture</h4>
    <p>Basada en capas independientes con el nÃºcleo en entidades de negocio.</p>
    <div style="text-align: center; margin: 1rem 0;">
        <img src="images/CleanArchitecture.jpg" alt="Diagrama Clean Architecture" style="max-width: 80%; border-radius: 8px; border: 1px solid #333;">
    </div>
</div>
' 
WHERE tema_id = 8; -- Updating the "ComparaciÃ³n" topic

-- Add new subtopic for "Consideraciones PrÃ¡cticas" if it doesn't exist, or append to Topic 1?
-- Let's put "Principios y Capas Recomendadas" as a new subtopic in Topic 1 (IntroducciÃ³n) as 1.4? Or maybe create a new Topic for it?
-- The user structure had "7. Arquitectura en capas". Let's update that one.

UPDATE subtemas 
SET contenido = '
<h4 style="color: var(--accent-blue);">Principios y Capas Recomendadas</h4>
<p>En guÃ­as oficiales como la de Android Developers, se recomienda una arquitectura en capas con al menos <strong>UI</strong> y <strong>Datos</strong>, y opcionalmente <strong>Dominio</strong>.</p>

<ul style="margin-left: 1.5rem; margin-bottom: 2rem; color: #ccc;">
    <li><strong>SeparaciÃ³n de problemas:</strong> Cada capa tiene una responsabilidad Ãºnica.</li>
    <li><strong>DiseÃ±os adaptables:</strong> La UI debe reaccionar a diferentes tamaÃ±os de pantalla.</li>
    <li><strong>Modelos de datos controlando la UI:</strong> La UI se reconstruye a partir de los datos, no al revÃ©s.</li>
    <li><strong>SSOT (Single Source of Truth):</strong> Una Ãºnica fuente de verdad para los datos.</li>
    <li><strong>UDF (Unidirectional Data Flow):</strong> El flujo de datos es unidireccional para evitar estados inconsistentes.</li>
</ul>

<h4 style="color: var(--accent-purple);">Tendencias 2026</h4>
<p>En 2026, las tendencias incluyen integraciÃ³n de IA para UIs dinÃ¡micas, arquitecturas modulares/microservices para escalabilidad y event-driven para real-time. Patrones como MVI y optimizaciÃ³n impulsada por IA ganan tracciÃ³n.</p>

<div class="highlight-box" style="border-left: 4px solid var(--accent-purple); background: rgba(128, 0, 128, 0.1); padding: 1rem; margin-top: 1rem;">
    <strong>Mejores PrÃ¡cticas:</strong>
    <ul style="margin-left: 1.5rem; margin-top: 0.5rem;">
        <li>SeparaciÃ³n de Concerns y SSOT.</li>
        <li>InyecciÃ³n de Dependencias (DI).</li>
        <li>Offline-First y Adaptabilidad.</li>
        <li>Seguridad y Rendimiento optimizados para baterÃ­a.</li>
    </ul>
</div>
'
WHERE tema_id = 7; -- Arquitectura en capas

USE mobile_architectures;

-- 1. Limpiar subtemas existentes del Tema 2 para evitar conflictos
DELETE FROM subtemas WHERE tema_id = 2;

-- 2. Insertar nuevo contenido para el Tema 2

-- 2.1 DefiniciÃ³n de MVC
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.1 DefiniciÃ³n de MVC', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Concepto Clave</h4>
        <p><strong>MVC (Model-View-Controller)</strong> se define como una arquitectura o patrÃ³n de diseÃ±o que divide la aplicaciÃ³n en tres componentes principales interconectados: <strong>Modelo (Model)</strong>, <strong>Vista (View)</strong> y <strong>Controlador (Controller)</strong>, con el objetivo principal de separar la lÃ³gica de negocio y los datos de la interfaz de usuario.</p>
    </div>

    <p>Este patrÃ³n, originado en los aÃ±os 70 para interfaces grÃ¡ficas, es ampliamente utilizado en desarrollo mÃ³vil (como en Android con Activities como Controllers, o iOS con UIViewControllers), ya que facilita la <strong>separaciÃ³n de preocupaciones (separation of concerns)</strong>, permitiendo que cambios en la UI no afecten la lÃ³gica de datos y viceversa.</p>

    <p>En apps mÃ³viles, MVC organiza el cÃ³digo en capas, donde el flujo tÃ­pico es: el usuario interactÃºa con la View, que notifica al Controller; este actualiza el Model y refresca la View, asegurando eficiencia en entornos con recursos limitados como baterÃ­a o memoria. Aunque no es estrictamente implementado en frameworks mÃ³viles modernos (que prefieren MVVM o MVP para mejor testabilidad), MVC sirve como base para apps simples, reduciendo complejidad y facilitando colaboraciÃ³n en equipos.</p>

    <div class="highlight-box" style="border: 1px dashed var(--accent-purple); padding: 1rem; border-radius: 8px; margin-top: 1rem; background: rgba(128, 0, 128, 0.05);">
        <strong>Resumen:</strong> MVC es un patrÃ³n clÃ¡sico que transforma el desarrollo de apps complejas en un proceso manejable, alineado con principios de modularidad y reutilizaciÃ³n.
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
    <p>Los componentes de MVC se dividen en tres roles interconectados, cada uno con responsabilidades especÃ­ficas para mantener la separaciÃ³n de preocupaciones en aplicaciones mÃ³viles.</p>

    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ“¦ Modelo (Model)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Gestiona los datos y la lÃ³gica de negocio, representando entidades del mundo real (usuarios, productos). Es responsable de almacenar, recuperar y manipular datos, aplicar reglas de negocio y validar integridad sin conocimiento de la UI.</p>
            <p style="font-size: 0.8rem; color: #888; margin-top: 0.5rem;"><em>Ejemplo: En e-commerce, maneja inventario y precios.</em></p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ‘ï¸ Vista (View)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Se encarga de la interfaz de usuario, presentando datos visualmente y manejando interacciones (botones, listas). Es pasiva y se enfoca en renderizaciÃ³n, no lÃ³gica.</p>
            <p style="font-size: 0.8rem; color: #888; margin-top: 0.5rem;"><em>Ejemplo: XML layouts en Android, Storyboards en iOS.</em></p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸŽ® Controlador (Controller)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Intermediario entre Model y View. Procesa entradas del usuario, actualiza el Model y refresca la View. Contiene la lÃ³gica principal de la aplicaciÃ³n.</p>
            <p style="font-size: 0.8rem; color: #888; margin-top: 0.5rem;"><em>Ejemplo: Activities en Android, UIViewController en iOS.</em></p>
        </div>

    </div>

    <p style="margin-top: 2rem; color: #aaa; font-style: italic;">Estos componentes interactÃºan unidireccionalmente: View â†’ Controller â†’ Model â†’ Controller â†’ View, asegurando un flujo eficiente.</p>
    '
);

-- 2.3 Flujo de ComunicaciÃ³n en MVC
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.3 Flujo de ComunicaciÃ³n en MVC', 
    '
    <p>Este subtema describe cÃ³mo fluye la informaciÃ³n entre el Modelo, la Vista y el Controlador en MVC. El flujo es unidireccional y cÃ­clico, basado en el principio de separaciÃ³n de preocupaciones.</p>

    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
        <ol style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;">
                <strong>AcciÃ³n del usuario en la Vista:</strong> El usuario interactÃºa con la interfaz (presiona un botÃ³n), generando un evento que se envÃ­a al Controlador.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Procesamiento en el Controlador:</strong> Recibe la entrada, valida, aplica lÃ³gica y decide si actualizar el Modelo.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>ActualizaciÃ³n del Modelo:</strong> Procesa cambios (interactuando con DB o API), actualiza sus datos y notifica al Controlador.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Refresco de la Vista:</strong> El Controlador recibe la notificaciÃ³n, obtiene datos actualizados y los envÃ­a a la Vista para mostrar los cambios.
            </li>
        </ol>
    </div>

    <div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
        <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=mvc%20architecture%20communication%20flow%20diagram%20user%20action%20controller%20model%20view%20cycle%20neon%20tech&image_size=landscape_16_9" alt="Diagrama de Flujo MVC" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
        <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama del Flujo de ComunicaciÃ³n en MVC</p>
    </div>
    '
);

-- 2.4 AplicaciÃ³n de MVC en Entornos MÃ³viles
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.4 AplicaciÃ³n de MVC en Entornos MÃ³viles', 
    '
    <p>Se analiza cÃ³mo se implementa MVC en aplicaciones mÃ³viles y las particularidades que presenta en plataformas como Android e iOS, donde algunos componentes pueden combinar responsabilidades para optimizar rendimiento.</p>

    <div class="platform-comparison" style="display: flex; flex-direction: column; gap: 2rem; margin-top: 2rem;">
        
        <div class="android-section" style="border-left: 4px solid #3ddc84; padding-left: 1.5rem;">
            <h3 style="color: #3ddc84;">ðŸ¤– ImplementaciÃ³n en Android</h3>
            <p>MVC se implementa con <strong>Activities o Fragments</strong> como Controladores, <strong>XML layouts</strong> como Vistas, y clases POJO como Modelos.</p>
            <p><strong>Particularidad:</strong> Los Controladores combinan responsabilidades de UI y lÃ³gica para eficiencia, pero pueden volverse clases infladas ("God Objects").</p>
            <div class="diagram-placeholder" style="margin: 1rem 0;">
                <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=android%20mvc%20architecture%20diagram%20activity%20xml%20model%20flow%20green%20tech%20style&image_size=landscape_16_9" alt="MVC en Android" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
            </div>
        </div>

        <div class="ios-section" style="border-left: 4px solid #007aff; padding-left: 1.5rem;">
            <h3 style="color: #007aff;">ðŸŽ ImplementaciÃ³n en iOS</h3>
            <p>MVC es el patrÃ³n nativo. <strong>UIViewController</strong> combina roles de Vista y Controlador, mientras que Modelos son clases separadas.</p>
            <p><strong>Particularidad:</strong> Optimizado para interfaces tÃ¡ctiles y ciclos de vida, pero propenso a "Massive View Controllers".</p>
            <div class="diagram-placeholder" style="margin: 1rem 0;">
                <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=ios%20mvc%20architecture%20diagram%20viewcontroller%20storyboard%20model%20blue%20tech%20style&image_size=landscape_16_9" alt="MVC en iOS" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
            </div>
        </div>

    </div>

    <div class="highlight-box" style="margin-top: 2rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 8px;">
        <h4 style="color: var(--text-main);">ConclusiÃ³n</h4>
        <p>En ambas plataformas, MVC facilita el desarrollo inicial pero suele evolucionar a MVVM o Clean Architecture en aplicaciones complejas para mejorar la testabilidad y el mantenimiento.</p>
    </div>
    '
);
USE mobile_architectures;

-- Insertar el nuevo subtema 2.5: AnÃ¡lisis de Costos y EvaluaciÃ³n de MVC
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.5 Ventajas y Desventajas de la arquitectura MVC', 
    '
    <p>A continuaciÃ³n se presenta un anÃ¡lisis detallado de costos y evaluaciÃ³n de la arquitectura MVC en aplicaciones mÃ³viles, integrando comparaciones con otros modelos y especificando cuÃ¡ndo representa una ventaja o desventaja.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem; margin-bottom: 1rem;">ðŸ“Š AnÃ¡lisis de Costos y EvaluaciÃ³n</h4>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 25%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 37.5%; border-right: 1px solid rgba(255,255,255,0.2);">âœ… Ventajas</th>
                    <th style="padding: 15px; text-align: left; width: 37.5%;">âŒ Desventajas</th>
                </tr>
            </thead>
            <tbody>
                <!-- Concepto General -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Concepto General</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Modelo arquitectÃ³nico simple y fÃ¡cil de comprender.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede volverse complejo y difÃ­cil de manejar en aplicaciones grandes.
                    </td>
                </tr>
                <!-- Aprendizaje -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Aprendizaje</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        FÃ¡cil de aprender e implementar, ideal para principiantes.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Requiere mayor disciplina y organizaciÃ³n a medida que crece el proyecto.
                    </td>
                </tr>
                <!-- ImplementaciÃ³n -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">ImplementaciÃ³n</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        RÃ¡pida implementaciÃ³n en proyectos pequeÃ±os o medianos (MVPs).
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        En proyectos complejos puede generar una estructura monolÃ­tica difÃ­cil de mantener.
                    </td>
                </tr>
                <!-- OrganizaciÃ³n del CÃ³digo -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">OrganizaciÃ³n del CÃ³digo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Separa Modelo, Vista y Controlador, mejorando la estructura inicial.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede surgir acoplamiento excesivo entre la Vista y el Controlador ("Massive View Controller").
                    </td>
                </tr>
                <!-- Escalabilidad -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Funciona bien en aplicaciones sencillas y prototipos.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        No es ideal para aplicaciones mÃ³viles muy complejas o de gran escala debido a la rigidez.
                    </td>
                </tr>
                <!-- Costo Inicial -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo Inicial</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Bajo costo inicial, herramientas gratuitas y configuraciÃ³n mÃ­nima.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        La deuda tÃ©cnica puede aumentar rÃ¡pidamente, requiriendo refactorizaciÃ³n costosa.
                    </td>
                </tr>
                <!-- Testing -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Pruebas unitarias sencillas para el Modelo (lÃ³gica de negocio pura).
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        DifÃ­cil de probar la lÃ³gica de UI/Controlador debido al alto acoplamiento.
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="highlight-box" style="border: 1px dashed var(--accent-blue); padding: 1rem; border-radius: 8px; margin-top: 1rem; background: rgba(0, 198, 255, 0.05);">
        <strong>ConclusiÃ³n del AnÃ¡lisis:</strong> MVC es la opciÃ³n mÃ¡s costo-efectiva para prototipos y aplicaciones de baja complejidad, pero su deuda tÃ©cnica aumenta exponencialmente con el tamaÃ±o del proyecto, donde arquitecturas como MVVM o Clean Architecture ofrecen mejor retorno de inversiÃ³n a largo plazo.
    </div>
    '
);

USE mobile_architectures;

-- 1. Limpiar subtemas existentes del Tema 3 para evitar duplicados
DELETE FROM subtemas WHERE tema_id = 3;

-- 2. Insertar nuevo contenido para el Tema 3 (MVP)

-- 3.1 DefiniciÃ³n y Concepto
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    3, 
    '3.1 DefiniciÃ³n y Concepto de MVP', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Â¿QuÃ© es MVP?</h4>
        <p><strong>MVP (Model-View-Presenter)</strong> es un patrÃ³n de arquitectura derivado de MVC, diseÃ±ado especÃ­ficamente para facilitar las pruebas unitarias y mejorar la separaciÃ³n de responsabilidades en interfaces de usuario modernas.</p>
    </div>

    <p>A diferencia de MVC, donde la Vista y el Modelo pueden estar estrechamente acoplados, en MVP el <strong>Presentador</strong> actÃºa como un intermediario estricto. La Vista es pasiva y no conoce al Modelo; toda la lÃ³gica de presentaciÃ³n se delega al Presentador.</p>

    <p>Este desacoplamiento permite que la lÃ³gica de la interfaz sea independiente de la plataforma (Android/iOS/Web), facilitando su prueba mediante tests unitarios sin necesidad de emuladores o dispositivos fÃ­sicos.</p>

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
    <p>La arquitectura MVP se compone de tres elementos fundamentales que interactÃºan a travÃ©s de interfaces (contratos):</p>

    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ“¦ Modelo (Model)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Responsable de los datos y la lÃ³gica de negocio. Accede a bases de datos, APIs o preferencias. Es idÃ©ntico al Modelo en MVC y no sabe nada de la Vista ni del Presentador.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ‘ï¸ Vista (View)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Interfaz pasiva que muestra datos y captura eventos del usuario. En MVP, la Vista implementa una interfaz que el Presentador utiliza para actualizarla, sin contener lÃ³gica alguna.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸŽ¤ Presentador (Presenter)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">El "cerebro" de la interacciÃ³n. Recibe eventos de la Vista, solicita datos al Modelo, aplica lÃ³gica de presentaciÃ³n y actualiza la Vista a travÃ©s de su interfaz. No depende de frameworks de UI.</p>
        </div>

    </div>
    '
);

-- 3.3 DinÃ¡mica de Funcionamiento
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    3, 
    '3.3 DinÃ¡mica de Funcionamiento', 
    '
    <p>El flujo de informaciÃ³n en MVP es bidireccional entre Vista y Presentador, pero siempre a travÃ©s de interfaces, garantizando un bajo acoplamiento.</p>

    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
        <h4 style="color: var(--accent-purple); margin-bottom: 1rem;">Ciclo de InteracciÃ³n TÃ­pico:</h4>
        <ol style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;">
                <strong>Evento de Usuario:</strong> El usuario realiza una acciÃ³n en la <em>Vista</em> (ej. clic en "Guardar").
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>NotificaciÃ³n:</strong> La <em>Vista</em> llama a un mÃ©todo del <em>Presentador</em> (ej. `presenter.onSaveClicked()`).
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>LÃ³gica y Datos:</strong> El <em>Presentador</em> procesa la acciÃ³n y solicita datos al <em>Modelo</em> si es necesario.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>ActualizaciÃ³n de UI:</strong> El <em>Presentador</em> recibe la respuesta del Modelo y llama a mÃ©todos de la interfaz de la <em>Vista</em> (ej. `view.showSuccessMessage()`) para mostrar el resultado.
            </li>
        </ol>
    </div>

    <p style="margin-top: 1rem;">Esta separaciÃ³n permite cambiar la implementaciÃ³n de la Vista (ej. de Android XML a Jetpack Compose) sin tocar una sola lÃ­nea de lÃ³gica en el Presentador.</p>
    '
);

-- 3.4 ImplementaciÃ³n y Ventajas
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    3, 
    '3.4 ImplementaciÃ³n y Ventajas', 
    '
    <h4 style="color: var(--accent-blue);">Ventajas Clave</h4>
    <ul style="margin-left: 1.5rem; margin-bottom: 2rem; color: #ccc;">
        <li><strong>Testabilidad:</strong> Al no depender de librerÃ­as de UI en el Presentador, se pueden escribir tests unitarios rÃ¡pidos y fiables (JUnit).</li>
        <li><strong>SeparaciÃ³n de Responsabilidades:</strong> CÃ³digo mÃ¡s limpio y mantenible. La Vista solo se preocupa de "cÃ³mo" mostrar, y el Presentador de "quÃ©" mostrar.</li>
        <li><strong>ReutilizaciÃ³n:</strong> Un mismo Presentador podrÃ­a, teÃ³ricamente, controlar diferentes Vistas (ej. mÃ³vil y tablet).</li>
    </ul>

    <h4 style="color: var(--accent-purple);">Desventajas</h4>
    <ul style="margin-left: 1.5rem; margin-bottom: 2rem; color: #ccc;">
        <li><strong>Verbosidad:</strong> Requiere crear muchas interfaces y clases (Contratos) para conectar Vistas y Presentadores.</li>
        <li><strong>Curva de Aprendizaje:</strong> Entender la comunicaciÃ³n a travÃ©s de interfaces puede ser complejo para principiantes.</li>
    </ul>
    '
);

-- 3.5 AnÃ¡lisis de Costos y EvaluaciÃ³n (Basado en ChatGPT)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    3, 
    '3.5 AnÃ¡lisis de Costos y EvaluaciÃ³n', 
    '
    <p>A continuaciÃ³n se presenta un anÃ¡lisis detallado de costos y evaluaciÃ³n de la arquitectura MVP, integrando comparaciones con otros modelos y especificando cuÃ¡ndo representa una ventaja o desventaja.</p>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">âœ… CuÃ¡ndo es Ventaja (y por quÃ©)</th>
                    <th style="padding: 15px; text-align: left; width: 40%;">âŒ CuÃ¡ndo es Desventaja (y por quÃ©)</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial de implementaciÃ³n</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Moderado.</strong> Aunque las herramientas son gratuitas, mejora la organizaciÃ³n desde el inicio comparado con MVC.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mayor inversiÃ³n inicial en tiempo de desarrollo debido a la creaciÃ³n de mÃ¡s clases e interfaces (contratos), lo que puede aumentar el costo en proyectos pequeÃ±os.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Infraestructura y herramientas</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Compatible con herramientas estÃ¡ndar gratuitas (Android Studio, Xcode, Git). No requiere licencias especiales.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        No reduce costos de infraestructura per se; si la app crece, los servicios cloud incrementan el gasto independientemente de la arquitectura.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        MÃ¡s estructurado que MVC, reduce el retrabajo y la deuda tÃ©cnica en proyectos medianos a largo plazo.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede ser mÃ¡s lento al inicio debido a la implementaciÃ³n de contratos (interfaces) entre Vista y Presentador (Boilerplate).
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Mejor que MVC en aplicaciones de complejidad media, gracias a un menor acoplamiento entre componentes de UI y lÃ³gica.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        En proyectos muy grandes (Enterprise), puede requerir complementarse con Clean Architecture para evitar Presentadores gigantes.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento a largo plazo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Reduce costos de mantenimiento significativamente porque separa claramente la lÃ³gica de presentaciÃ³n de la Vista.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede volverse complejo si existen demasiados Presentadores o si no se mantiene una buena organizaciÃ³n de paquetes.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Gran ventaja.</strong> El Presentador puede probarse fÃ¡cilmente mediante pruebas unitarias (JVM) sin depender de la UI o emuladores.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Requiere configuraciÃ³n adicional para pruebas (Mocks), lo que puede aumentar ligeramente el costo inicial de QA.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">ComparaciÃ³n con MVC</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Ofrece mejor organizaciÃ³n, menor acoplamiento y superior capacidad de testing, reduciendo costos futuros de refactorizaciÃ³n.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Introduce mÃ¡s cÃ³digo y estructura que MVC, lo que puede ser sobreingenierÃ­a innecesaria para apps muy simples o prototipos.
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">ComparaciÃ³n con Clean Architecture</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Menor costo y complejidad inicial que Clean Architecture; es mÃ¡s fÃ¡cil de entender e implementar para equipos medianos.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Clean Architecture ofrece mejor modularidad y escalabilidad en proyectos empresariales masivos, donde MVP podrÃ­a quedarse corto.
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="highlight-box" style="border: 1px dashed var(--accent-blue); padding: 1rem; border-radius: 8px; margin-top: 1rem; background: rgba(0, 198, 255, 0.05);">
        <strong>ConclusiÃ³n del AnÃ¡lisis:</strong> MVP es ideal para proyectos de complejidad media donde la testabilidad es prioritaria, ofreciendo un excelente equilibrio entre estructura y costo de implementaciÃ³n, superando a MVC en mantenimiento pero siendo mÃ¡s ligero que Clean Architecture.
    </div>
    '
);

USE mobile_architectures;

-- 1. Limpiar subtemas existentes del Tema 4
DELETE FROM subtemas WHERE tema_id = 4;

-- 2. Insertar nuevo contenido para el Tema 4 (MVVM)

-- 4.1 DefiniciÃ³n
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    4, 
    '4.1 DefiniciÃ³n de MVVM', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">DefiniciÃ³n Ampliada y Fundamentada</h4>
        <p><strong>MVVM (Model-View-ViewModel)</strong> representa un patrÃ³n arquitectÃ³nico diseÃ±ado para desacoplar de manera efectiva la lÃ³gica de negocio, la lÃ³gica de presentaciÃ³n y la interfaz grÃ¡fica del usuario, introduciendo un intermediario clave conocido como <strong>ViewModel</strong>.</p>
    </div>

    <p>Este patrÃ³n se deriva como una variante especializada del Presentation Model y una refinaciÃ³n del clÃ¡sico MVC, adaptada especÃ­ficamente para entornos que incorporan mecanismos de <strong>data binding automÃ¡tico</strong> y enfoques de <strong>programaciÃ³n reactiva</strong>, facilitando una interacciÃ³n mÃ¡s fluida entre componentes. En prÃ¡ctica, MVVM permite que las actualizaciones en los datos se propaguen automÃ¡ticamente a la interfaz sin requerir cÃ³digo imperativo extenso, lo que reduce la complejidad en aplicaciones con interfaces dinÃ¡micas y reduce el riesgo de errores relacionados con sincronizaciÃ³n manual.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">ðŸ“Œ Fundamento TeÃ³rico</h4>
    <p>El MVVM se sustenta en principios fundamentales de la ingenierÃ­a de software:</p>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>SeparaciÃ³n de Responsabilidades (SoC):</strong> Asegura que cada mÃ³dulo se enfoque en una tarea especÃ­fica.</li>
        <li><strong>InversiÃ³n de Dependencias:</strong> Promueve dependencias abstractas para mayor flexibilidad y testabilidad.</li>
        <li><strong>PatrÃ³n Observer:</strong> Permite notificaciones automÃ¡ticas de cambios en tiempo real.</li>
        <li><strong>Arquitecturas Orientadas a Estado:</strong> Donde el estado centralizado dicta el comportamiento.</li>
        <li><strong>ProgramaciÃ³n Reactiva:</strong> Maneja flujos de datos dinÃ¡micos y eventos asincrÃ³nicos.</li>
    </ul>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">ðŸ“Š Nivel de AdopciÃ³n Actual</h4>
    <p>En el panorama actual, MVVM es promovido como estÃ¡ndar en:</p>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>Android:</strong> Integrado con Jetpack (ViewModel, LiveData) y Clean Architecture.</li>
        <li><strong>iOS:</strong> Con SwiftUI, que se alinea naturalmente con MVVM gracias a su enfoque basado en estado observable.</li>
        <li><strong>.NET (MAUI/WPF):</strong> Base para interfaces ricas en XAML.</li>
    </ul>
    <p>Se aplica en escenarios reales como apps bancarias, plataformas de transporte y comercio electrÃ³nico. En proyectos de larga duraciÃ³n (3 a 5 aÃ±os), las arquitecturas desacopladas como MVVM agilizan la incorporaciÃ³n de nuevos desarrolladores y optimizan el mantenimiento.</p>
    '
);

-- 4.2 Componentes
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    4, 
    '4.2 Componentes de MVVM', 
    '
    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ Model (Capa de Dominio y Datos)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Encapsula las entidades del negocio, casos de uso, accesos a bases de datos y APIs. Es el corazÃ³n funcional y debe mantenerse independiente de la UI. En proyectos grandes, se estratifica en dominio puro, datos y repositorios, facilitando la integraciÃ³n con SQL/NoSQL o servicios cloud como Firebase.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ View (Capa de PresentaciÃ³n Visual)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Se limita a renderizar datos y capturar eventos (toques, gestos). Se suscribe al ViewModel para reflejar cambios en tiempo real. Adopta un rol pasivo, ideal para interfaces declarativas como Jetpack Compose o SwiftUI, evitando lÃ³gica de negocio.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ ViewModel (Estado y LÃ³gica)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Elemento pivotal que transforma datos del Modelo para la View. Gestiona estados (carga, Ã©xito, error), coordina operaciones asincrÃ³nicas y realiza validaciones de UI. Funciona como un adaptador que aÃ­sla la lÃ³gica de presentaciÃ³n, haciÃ©ndola reutilizable y testable.</p>
        </div>

    </div>

    <div class="highlight-box" style="margin-top: 2rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 8px;">
        <h4 style="color: var(--text-main);">ðŸ“Š Beneficio Estructural</h4>
        <p>Facilita la colaboraciÃ³n en equipos multidisciplinarios: especialistas en UI para la View, lÃ³gica para el ViewModel y backend para el Model, permitiendo desarrollo paralelo sin conflictos.</p>
    </div>
    '
);

-- 4.3 Data Binding y Observabilidad
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    4, 
    '4.3 Data Binding y Observabilidad', 
    '
    <h4 style="color: var(--accent-blue);">ðŸ”¹ Observabilidad</h4>
    <p>Basada en el <strong>PatrÃ³n Observer</strong>, permite que el ViewModel emita notificaciones automÃ¡ticas a sus suscriptores (la View) ante cambios de estado. Esto elimina actualizaciones manuales y asegura sincronizaciÃ³n en tiempo real usando mecanismos como <em>LiveData</em> o <em>StateFlow</em>.</p>

    <h4 style="color: var(--accent-purple); margin-top: 1.5rem;">ðŸ”¹ Estados en MVVM</h4>
    <p>Las arquitecturas modernas incorporan estados explÃ­citos en el ViewModel:</p>
    <ul style="margin-left: 1.5rem; color: #ccc; display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
        <li>â³ <strong>Idle:</strong> Inactivo/Inicial.</li>
        <li>ðŸ”„ <strong>Loading:</strong> Cargando con progreso.</li>
        <li>âœ… <strong>Success:</strong> Datos listos para renderizar.</li>
        <li>âŒ <strong>Error:</strong> Mensaje de fallo o reintento.</li>
    </ul>
    <p>La View reacciona a estos estados, esencial para operaciones asincrÃ³nicas como llamadas a API o bases de datos, garantizando una UX fluida.</p>

    <h4 style="color: var(--accent-blue); margin-top: 1.5rem;">ðŸ”¹ IntegraciÃ³n con ProgramaciÃ³n Reactiva</h4>
    <p>MVVM se acopla con paradigmas reactivos (RxJava, Kotlin Flows), manejando flujos de datos continuos y eventos asincrÃ³nicos. Ideal para apps con actualizaciones en vivo o IoT, evitando estados mutables y reduciendo bugs de concurrencia.</p>

    <div class="highlight-box" style="border-left: 4px solid var(--accent-green); background: rgba(0, 255, 0, 0.05); padding: 1rem; margin-top: 1rem;">
        <strong>ðŸ“ˆ MÃ©tricas TÃ©cnicas:</strong> Enfoques reactivos reducen inconsistencias de estado, aumentan la cobertura de pruebas unitarias y minimizan dependencias cÃ­clicas.
    </div>
    '
);

-- 4.4 ImplementaciÃ³n y Flujo
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    4, 
    '4.4 ImplementaciÃ³n de MVVM en aplicaciones mÃ³viles', 
    '
    <p>El flujo tÃ­pico en MVVM sigue una secuencia reactiva:</p>
    
    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1rem;">
        <ol style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;"><strong>Captura:</strong> La Vista captura un evento del usuario y lo envÃ­a al ViewModel.</li>
            <li style="margin-bottom: 1rem;"><strong>Procesamiento:</strong> El ViewModel interactÃºa con el Modelo para procesar la lÃ³gica de negocio.</li>
            <li style="margin-bottom: 1rem;"><strong>Estado:</strong> El ViewModel actualiza su estado interno (State).</li>
            <li style="margin-bottom: 1rem;"><strong>ReacciÃ³n:</strong> La Vista, suscrita al estado, se actualiza automÃ¡ticamente.</li>
        </ol>
    </div>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">ðŸ”¹ Arquitectura basada en estado</h4>
    <p>Con el ViewModel como "custodio central", la Vista solo renderiza el estado actual. Esto simplifica la depuraciÃ³n (logs de estado), el testing (mocks de estados) y el anÃ¡lisis de errores en producciÃ³n.</p>

    <h4 style="color: var(--accent-blue); margin-top: 1.5rem;">ðŸ”¹ ComparaciÃ³n con MVC</h4>
    <p>Mientras MVC puede llevar a controladores monolÃ­ticos y vistas con lÃ³gica, MVVM centraliza el estado y organiza componentes de forma predictiva, alineÃ¡ndose con necesidades de escalabilidad y mantenimiento prolongado.</p>
    '
);

-- 4.5 Tabla de Ventajas y Desventajas (ChatGPT)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    4, 
    '4.5 AnÃ¡lisis de Costos y EvaluaciÃ³n de MVVM', 
    '
    <p>AnÃ¡lisis detallado de costos, implementaciÃ³n y evaluaciÃ³n del modelo MVVM.</p>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">âœ… CuÃ¡ndo es Ventaja (y por quÃ©)</th>
                    <th style="padding: 15px; text-align: left; width: 40%;">âŒ CuÃ¡ndo es Desventaja (y por quÃ©)</th>
                </tr>
            </thead>
            <tbody>
                <!-- Fila 1 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial de implementaciÃ³n</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Mejor organizaciÃ³n desde el inicio mediante separaciÃ³n entre Vista, Modelo y ViewModel. Reduce errores futuros.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mayor costo inicial en tiempo y aprendizaje debido al uso de data binding, observables y arquitectura mÃ¡s compleja.
                    </td>
                </tr>
                <!-- Fila 2 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Infraestructura y herramientas</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Compatible con herramientas modernas gratuitas como Android Studio y frameworks de UI reactiva.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede requerir librerÃ­as adicionales o mayor configuraciÃ³n tÃ©cnica, aumentando la complejidad inicial.
                    </td>
                </tr>
                <!-- Fila 3 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Automatiza la actualizaciÃ³n de la interfaz mediante enlace de datos (Data Binding), reduciendo cÃ³digo repetitivo.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        ImplementaciÃ³n inicial mÃ¡s lenta comparada con MVC debido a la configuraciÃ³n del ViewModel y observadores.
                    </td>
                </tr>
                <!-- Fila 4 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Alta escalabilidad gracias al bajo acoplamiento entre interfaz y lÃ³gica de presentaciÃ³n. Ideal para aplicaciones grandes.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede resultar innecesariamente complejo en aplicaciones pequeÃ±as o prototipos simples.
                    </td>
                </tr>
                <!-- Fila 5 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento a largo plazo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Facilita modificaciones sin afectar otras capas del sistema, reduciendo costos de mantenimiento.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Si no se estructura correctamente, el ViewModel puede crecer demasiado y volverse difÃ­cil de gestionar.
                    </td>
                </tr>
                <!-- Fila 6 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        <strong>Gran ventaja:</strong> el ViewModel puede probarse sin depender de la interfaz grÃ¡fica, mejorando la calidad del software.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Requiere conocimientos adicionales para configurar pruebas reactivas o asincrÃ³nicas.
                    </td>
                </tr>
                <!-- Fila 7 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">ComparaciÃ³n con MVC</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Reduce el acoplamiento y mejora actualizaciÃ³n automÃ¡tica de la UI, disminuyendo mantenimiento futuro.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        MVC es mÃ¡s simple y rÃ¡pido de implementar en proyectos pequeÃ±os.
                    </td>
                </tr>
                <!-- Fila 8 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">ComparaciÃ³n con MVP</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Menor cantidad de interfaces que MVP y mejor integraciÃ³n con interfaces reactivas modernas.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        MVP puede ser mÃ¡s fÃ¡cil de comprender para equipos sin experiencia en programaciÃ³n reactiva.
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

-- 5.1 DefiniciÃ³n de MVI
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    5, 
    '5.1 DefiniciÃ³n de MVI', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">DefiniciÃ³n Ampliada y Fundamentada</h4>
        <p>La arquitectura <strong>MVI (Modelâ€“Viewâ€“Intent)</strong> es un patrÃ³n arquitectÃ³nico centrado en el manejo explÃ­cito de <strong>estados inmutables</strong> y en un <strong>flujo unidireccional de datos</strong>, donde las acciones del usuario se representan como <em>intents</em> (intenciones) que desencadenan transiciones controladas.</p>
    </div>

    <p>MVI emerge como una evoluciÃ³n influenciada por arquitecturas reactivas (Redux, Elm Architecture) y principios de programaciÃ³n funcional. Este enfoque transforma la aplicaciÃ³n en una entidad predecible, ideal para entornos donde la depuraciÃ³n y la reproducibilidad son crÃ­ticas.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">ðŸ“Œ DefiniciÃ³n TÃ©cnica</h4>
    <p>La aplicaciÃ³n se conceptualiza como una <strong>mÃ¡quina de estados finita</strong>. El estado es Ãºnico, inmutable y encapsula toda la informaciÃ³n de la UI. Los cambios solo se producen mediante <em>Intents</em> procesados por un <em>Reducer</em>, generando un nuevo estado completo sin alterar el anterior. El objetivo es garantizar previsibilidad absoluta y trazabilidad total.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">ðŸŽ¯ Fundamento Conceptual</h4>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>Estado Inmutable:</strong> Evita side effects inesperados y race conditions.</li>
        <li><strong>Funciones Puras:</strong> ReducciÃ³n de efectos secundarios; solo dependen de inputs.</li>
        <li><strong>Flujo Unidireccional:</strong> Simplifica el razonamiento y elimina dependencias cÃ­clicas.</li>
        <li><strong>Arquitectura Declarativa:</strong> La UI se describe en tÃ©rminos de estado actual.</li>
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
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ Model (Estado)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Encarna el estado completo e inmutable de la UI (datos, flags de carga, errores). Ejemplo: <code>data class UiState(...)</code>. Cada cambio crea un nuevo estado completo, preservando la historia y facilitando auditorÃ­as.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ View (Renderizado)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Renderiza el estado actual de forma declarativa y envÃ­a <em>Intents</em>. Es pasiva y reactiva, ideal para frameworks como Compose o SwiftUI que se recomponen basados en diffs de estado.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ Intent (IntenciÃ³n)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Representa la intenciÃ³n del usuario o evento del sistema (ej. <code>LoadData</code>, <code>SubmitForm</code>). Son comandos inmutables que no alteran el estado directamente, sino que se procesan centralizadamente.</p>
        </div>
        
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #ff00ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ Reducer (Procesador)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">FunciÃ³n pura que recibe el estado actual y un intent, y computa el nuevo estado. Asegura que la lÃ³gica sea testable y predecible, manejando transiciones de forma determinista.</p>
        </div>

    </div>
    
    <div class="highlight-box" style="margin-top: 2rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 8px;">
        <strong>ðŸ“Š Estructura Resumida:</strong> Intent â†’ Reducer â†’ Nuevo Estado â†’ Vista. Los efectos secundarios (API calls) se manejan en canales separados para mantener la pureza.
    </div>
    '
);

-- 5.3 Flujo Unidireccional
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    5, 
    '5.3 Flujo Unidireccional de Datos', 
    '
    <p>Una caracterÃ­stica central de MVI es el flujo unidireccional (UDF), que impone una direcciÃ³n estricta para eliminar ambigÃ¼edades.</p>

    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
        <h4 style="color: var(--accent-purple); margin-bottom: 1rem;">ðŸ”„ Ciclo de Flujo TÃ­pico:</h4>
        <ol style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;"><strong>Intent:</strong> El usuario genera una acciÃ³n desde la View.</li>
            <li style="margin-bottom: 1rem;"><strong>Procesamiento:</strong> El Intent llega al Reducer (lÃ³gica sincrÃ³nica/asincrÃ³nica).</li>
            <li style="margin-bottom: 1rem;"><strong>Nuevo Estado:</strong> Se produce un estado inmutable basado en el resultado.</li>
            <li style="margin-bottom: 1rem;"><strong>Renderizado:</strong> La View se actualiza automÃ¡ticamente con el nuevo estado.</li>
        </ol>
    </div>

    <h4 style="color: var(--accent-blue); margin-top: 2rem;">ðŸ”¹ Ventajas del Flujo Unidireccional</h4>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>DepuraciÃ³n:</strong> Permite rastrear cada intent a su estado resultante (linealidad).</li>
        <li><strong>Sin Efectos Colaterales:</strong> Mutaciones confinadas a funciones puras.</li>
        <li><strong>Consistencia:</strong> Evita inconsistencias en entornos concurrentes.</li>
    </ul>

    <h4 style="color: var(--accent-purple); margin-top: 1.5rem;">ðŸ”¹ ComparaciÃ³n con MVVM</h4>
    <p>A diferencia de MVVM que puede tener mÃºltiples estados dispersos, MVI mantiene un <strong>Ãºnico estado centralizado</strong>, promoviendo una arquitectura mÃ¡s estricta alineada con principios funcionales.</p>
    '
);

-- 5.4 Manejo de Estados
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    5, 
    '5.4 Manejo de Estados', 
    '
    <p>En MVI, el estado es explÃ­cito, completo e inmutable. No existen estados implÃ­citos; toda la informaciÃ³n se consolida en una estructura Ãºnica visible y auditable.</p>

    <h4 style="color: var(--accent-blue); margin-top: 1.5rem;">ðŸ”¹ Beneficios TÃ©cnicos</h4>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>Reproducibilidad:</strong> FÃ¡cil recreaciÃ³n de errores mediante secuencias de intents.</li>
        <li><strong>Time-Travel Debugging:</strong> Posible en frameworks compatibles.</li>
        <li><strong>Estabilidad:</strong> ReducciÃ³n de condiciones de carrera mediante inmutabilidad estricta.</li>
    </ul>

    <h4 style="color: var(--accent-purple); margin-top: 1.5rem;">ðŸ”¹ Estados Comunes</h4>
    <ul style="margin-left: 1.5rem; color: #ccc; display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
        <li>â³ <strong>Idle:</strong> InicializaciÃ³n.</li>
        <li>ðŸ”„ <strong>Loading:</strong> Progreso parcial.</li>
        <li>âœ… <strong>Success:</strong> Datos validados.</li>
        <li>âŒ <strong>Error:</strong> Detalles recuperables.</li>
        <li>ðŸš« <strong>Empty:</strong> Sin datos.</li>
    </ul>

    <div class="highlight-box" style="border-left: 4px solid var(--accent-green); background: rgba(0, 255, 0, 0.05); padding: 1rem; margin-top: 1rem;">
        <strong>ðŸ“ˆ Impacto PrÃ¡ctico:</strong> Minimiza errores crÃ­ticos en apps transaccionales (banca), facilita el testing con mocks puros y mejora el rendimiento con re-renders optimizados.
    </div>
    '
);

-- 5.5 Tabla de Ventajas y Desventajas (ChatGPT)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    5, 
    '5.5 Ventajas y Desventajas de MVI', 
    '
    <p>AnÃ¡lisis detallado de costos, implementaciÃ³n y evaluaciÃ³n de la arquitectura MVI.</p>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">âœ… CuÃ¡ndo es Ventaja (y por quÃ©)</th>
                    <th style="padding: 15px; text-align: left; width: 40%;">âŒ CuÃ¡ndo es Desventaja (y por quÃ©)</th>
                </tr>
            </thead>
            <tbody>
                <!-- Fila 1 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial de implementaciÃ³n</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Proporciona una estructura muy organizada basada en flujo unidireccional de datos, reduciendo errores desde el inicio.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Alto costo inicial en tiempo y aprendizaje debido a su complejidad conceptual y configuraciÃ³n arquitectÃ³nica.
                    </td>
                </tr>
                <!-- Fila 2 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Infraestructura y herramientas</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Funciona muy bien con tecnologÃ­as modernas reactivas y manejo de estados, mejorando estabilidad del sistema.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede requerir librerÃ­as reactivas adicionales y mayor conocimiento tÃ©cnico del equipo.
                    </td>
                </tr>
                <!-- Fila 3 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Reduce errores de sincronizaciÃ³n de interfaz gracias al manejo centralizado del estado.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Desarrollo inicial mÃ¡s lento por la implementaciÃ³n de estados, intents y reducers.
                    </td>
                </tr>
                <!-- Fila 4 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Muy alta escalabilidad. Ideal para aplicaciones grandes y sistemas complejos con mÃºltiples estados de interfaz.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede ser excesivo para aplicaciones pequeÃ±as o medianas donde la complejidad no es necesaria.
                    </td>
                </tr>
                <!-- Fila 5 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento a largo plazo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Facilita el mantenimiento al tener un Ãºnico estado de la aplicaciÃ³n y flujo predecible de datos.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mayor cantidad de cÃ³digo y estructura puede dificultar comprensiÃ³n para equipos sin experiencia.
                    </td>
                </tr>
                <!-- Fila 6 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Excelente para pruebas unitarias debido a su flujo determinÃ­stico y controlado.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Requiere conocimientos avanzados para probar flujos reactivos y manejo de estados.
                    </td>
                </tr>
                <!-- Fila 7 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">ComparaciÃ³n con MVVM</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Mayor control del estado y comportamiento predecible de la UI. Reduce errores de inconsistencia visual.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        MVVM es mÃ¡s sencillo de implementar y requiere menor curva de aprendizaje.
                    </td>
                </tr>
                <!-- Fila 8 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">ComparaciÃ³n con MVC y MVP</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Minimiza el acoplamiento y evita problemas de lÃ³gica distribuida entre componentes.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mucho mÃ¡s complejo que MVC o MVP para proyectos simples.
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

-- 6.1 DefiniciÃ³n de Clean Architecture
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    6, 
    '6.1 DefiniciÃ³n de Clean Architecture', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">DefiniciÃ³n Ampliada y Fundamentada</h4>
        <p><strong>Clean Architecture</strong> es un enfoque arquitectÃ³nico propuesto por Robert C. Martin (Uncle Bob) que organiza el software en <strong>capas concÃ©ntricas</strong>, priorizando la independencia del dominio respecto a frameworks, bases de datos y detalles de implementaciÃ³n.</p>
    </div>

    <p>Su principio central establece que las <strong>reglas de negocio no deben depender de detalles externos</strong>; en cambio, los detalles deben depender del dominio, invirtiendo el flujo tradicional de dependencias. Este patrÃ³n se inspira en la SeparaciÃ³n de Responsabilidades (SoC) y el Principio de InversiÃ³n de Dependencias (DIP), creando un nÃºcleo de negocio puro que permanece estable ante cambios tecnolÃ³gicos.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">ðŸ“Œ Fundamento TeÃ³rico</h4>
    <p>Las capas funcionan como cÃ­rculos concÃ©ntricos: el centro alberga las entidades esenciales, rodeado por capas que agregan funcionalidad pero dependen hacia adentro. Esto asegura que el dominio dicte las abstracciones, facilitando la portabilidad entre plataformas (Android/iOS/Web) y mitigando la deuda tÃ©cnica causada por actualizaciones de SDKs.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">ðŸ“Š Nivel de AdopciÃ³n Actual</h4>
    <p>Ampliamente recomendada en guÃ­as oficiales de Android (junto a MVVM) y en iOS para apps modulares. Se aplica en proyectos de gran escala como apps bancarias, e-commerce y salud, facilitando la migraciÃ³n de tecnologÃ­as (ej. cambiar de base de datos) sin refactorizar el dominio y optimizando el trabajo en equipos especializados.</p>
    '
);

-- 6.2 Capas de Clean Architecture
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    6, 
    '6.2 Capas de Clean Architecture', 
    '
    <p>Las capas forman una estructura jerÃ¡rquica donde las dependencias fluyen estrictamente hacia el interior, asegurando que el nÃºcleo permanezca independiente.</p>

    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #ffcc00;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ Entidades (Entities)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Capa central. Contiene reglas de negocio fundamentales y objetos de dominio (ej. Usuario, TransacciÃ³n). Son independientes de frameworks y reutilizables en cualquier contexto.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #ff6666;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ Casos de Uso (Use Cases)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">LÃ³gica de aplicaciÃ³n especÃ­fica (ej. "RegistrarUsuario"). Coordinan el flujo de datos entre entidades y capas externas, orquestando operaciones atÃ³micas.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #66cc66;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ Adaptadores de Interfaz</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Transforman datos entre el dominio y el exterior. Incluye Presenters/ViewModels, controladores de API y gateways de bases de datos.</p>
        </div>
        
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #3399ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ Frameworks y Drivers</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Capa externa con detalles concretos: UI (Activity/View), Bases de Datos (Room/Realm), APIs (Retrofit) y servicios cloud. Son "detalles" reemplazables.</p>
        </div>

    </div>
    
    <div class="highlight-box" style="margin-top: 2rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 8px;">
        <strong>ðŸ“Š Beneficio Estructural:</strong> Permite desarrollo paralelo y optimiza flujos en proyectos multiplataforma, reduciendo el impacto de cambios en bibliotecas externas.
    </div>
    '
);

-- 6.3 Principio de InversiÃ³n de Dependencias
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    6, 
    '6.3 Principio de InversiÃ³n de Dependencias (DIP)', 
    '
    <h4 style="color: var(--accent-blue);">DefiniciÃ³n ArquitectÃ³nica</h4>
    <p>El <strong>Principio de InversiÃ³n de Dependencias (DIP)</strong> establece que los mÃ³dulos de alto nivel no deben depender de los de bajo nivel; ambos deben depender de <strong>abstracciones</strong>. En Clean Architecture, esto significa que las capas externas (UI, DB) dependen del dominio, invirtiendo el control tradicional.</p>

    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
        <h4 style="color: var(--accent-purple); margin-bottom: 1rem;">âš™ï¸ Mecanismo de InversiÃ³n:</h4>
        <ul style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;"><strong>Abstracciones en el Dominio:</strong> Se definen interfaces (ej. <code>UserRepository</code>) en la capa interna.</li>
            <li style="margin-bottom: 1rem;"><strong>Implementaciones Externas:</strong> Las capas externas implementan estas interfaces (ej. <code>SqlUserRepository</code>).</li>
            <li style="margin-bottom: 1rem;"><strong>InyecciÃ³n de Dependencias:</strong> Frameworks como Dagger o Hilt resuelven estas dependencias en tiempo de ejecuciÃ³n.</li>
        </ul>
    </div>

    <p style="margin-top: 1rem;">Esto permite <strong>desacoplamiento total</strong>, facilitando la sustituciÃ³n de frameworks (ej. cambiar de Firebase a Supabase) y el testing con mocks, simulando escenarios sin depender de servicios reales.</p>
    '
);

-- 6.4 IntegraciÃ³n con MVVM/MVP
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    6, 
    '6.4 IntegraciÃ³n con MVVM/MVP', 
    '
    <p>Clean Architecture no reemplaza a patrones como MVVM o MVP, sino que los <strong>complementa</strong>. Mientras Clean Architecture organiza las capas estructurales globales, MVVM/MVP gestionan la interacciÃ³n especÃ­fica de la capa de presentaciÃ³n.</p>

    <h4 style="color: var(--accent-blue); margin-top: 1.5rem;">ðŸ”¹ CÃ³mo se integran:</h4>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>Dominio:</strong> Contiene Entidades y Casos de Uso (independientes de la UI).</li>
        <li><strong>Capa de Adaptadores (PresentaciÃ³n):</strong> AquÃ­ residen los ViewModels (MVVM) o Presenters (MVP).</li>
        <li><strong>Flujo:</strong> El ViewModel/Presenter invoca Casos de Uso, recibe datos del dominio y actualiza la Vista (Activity/SwiftUI).</li>
    </ul>

    <div class="highlight-box" style="border-left: 4px solid var(--accent-green); background: rgba(0, 255, 0, 0.05); padding: 1rem; margin-top: 1rem;">
        <strong>En la prÃ¡ctica:</strong> En Android, un ViewModel consume un Caso de Uso (ej. <code>GetUsersUseCase</code>) y expone el resultado vÃ­a <code>StateFlow</code> a la UI. En iOS, un ViewModel consume el Caso de Uso y publica cambios en propiedades <code>@Published</code> para SwiftUI.
    </div>
    '
);

-- 6.5 Tabla de Ventajas y Desventajas (ChatGPT)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    6, 
    '6.5 Ventajas y Desventajas de Clean Architecture', 
    '
    <p>AnÃ¡lisis detallado de costos, implementaciÃ³n y evaluaciÃ³n de Clean Architecture en aplicaciones mÃ³viles.</p>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">âœ… CuÃ¡ndo es Ventaja (y por quÃ©)</th>
                    <th style="padding: 15px; text-align: left; width: 40%;">âŒ CuÃ¡ndo es Desventaja (y por quÃ©)</th>
                </tr>
            </thead>
            <tbody>
                <!-- Fila 1 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial de implementaciÃ³n</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Permite una estructura altamente organizada desde el inicio, reduciendo errores futuros y facilitando el crecimiento del sistema.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Alto costo inicial en tiempo, diseÃ±o y planificaciÃ³n debido a la gran cantidad de capas y reglas arquitectÃ³nicas.
                    </td>
                </tr>
                <!-- Fila 2 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Infraestructura y herramientas</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Independiente de frameworks o tecnologÃ­as, permitiendo cambiar herramientas sin afectar la lÃ³gica principal.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Requiere mayor configuraciÃ³n del proyecto y conocimiento avanzado del equipo de desarrollo.
                    </td>
                </tr>
                <!-- Fila 3 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Disminuye retrabajo en proyectos grandes gracias a la clara separaciÃ³n entre capas (dominio, datos y presentaciÃ³n).
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Desarrollo inicial mÃ¡s lento por la implementaciÃ³n de mÃºltiples mÃ³dulos y dependencias.
                    </td>
                </tr>
                <!-- Fila 4 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Muy alta escalabilidad. Ideal para aplicaciones empresariales o proyectos de larga duraciÃ³n.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede resultar excesiva para aplicaciones pequeÃ±as o prototipos rÃ¡pidos.
                    </td>
                </tr>
                <!-- Fila 5 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Mantenimiento a largo plazo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Gran ventaja: facilita modificaciones sin afectar todo el sistema, reduciendo costos de mantenimiento.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mayor complejidad estructural puede dificultar comprensiÃ³n para desarrolladores sin experiencia.
                    </td>
                </tr>
                <!-- Fila 6 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Excelente soporte para pruebas unitarias al aislar completamente la lÃ³gica de negocio.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Configurar pruebas puede requerir mayor preparaciÃ³n tÃ©cnica inicial.
                    </td>
                </tr>
                <!-- Fila 7 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">ComparaciÃ³n con MVC, MVP y MVVM</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Mejor separaciÃ³n de responsabilidades y menor dependencia tecnolÃ³gica, aumentando estabilidad del proyecto.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Mucho mÃ¡s compleja y costosa de implementar que MVC, MVP o MVVM en proyectos simples.
                    </td>
                </tr>
                <!-- Fila 8 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">ComparaciÃ³n con MVI</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        MÃ¡s flexible tecnolÃ³gicamente y aplicable a distintos patrones de presentaciÃ³n.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        MVI puede ser mÃ¡s directo para manejo especÃ­fico de estados en interfaces reactivas.
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

-- 7.1 DefiniciÃ³n
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    7, 
    '7.1 DefiniciÃ³n de Arquitectura en Capas', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">DefiniciÃ³n Ampliada y Fundamentada</h4>
        <p>La <strong>Arquitectura Basada en Capas (Layered Architecture)</strong> es un estilo arquitectÃ³nico que organiza una aplicaciÃ³n en niveles jerÃ¡rquicos, donde cada capa tiene responsabilidades especÃ­ficas y solo interactÃºa con la capa inmediatamente inferior o superior.</p>
    </div>

    <p>Promueve un flujo controlado de datos y comandos para evitar dependencias cruzadas. Es uno de los estilos mÃ¡s antiguos y utilizados en ingenierÃ­a de software, derivado de principios establecidos en sistemas mainframe y evolucionado hacia arquitecturas modernas como microservicios.</p>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">ðŸ“Œ DefiniciÃ³n TÃ©cnica</h4>
    <ul style="margin-left: 1.5rem; color: #ccc;">
        <li><strong>SeparaciÃ³n de Responsabilidades (SoC):</strong> Asigna funciones Ãºnicas a cada nivel.</li>
        <li><strong>Encapsulamiento Funcional:</strong> Oculta implementaciones internas y protege la integridad.</li>
        <li><strong>Desacoplamiento Estructural:</strong> Minimiza impactos de cambios mediante interfaces o contratos.</li>
    </ul>

    <h4 style="color: var(--accent-purple); margin-top: 2rem;">ðŸŽ¯ Objetivo Principal</h4>
    <p>Mejorar la organizaciÃ³n estructural, facilitar el mantenimiento mediante actualizaciones localizadas, permitir escalabilidad horizontal/vertical y reducir el acoplamiento forzando dependencias unidireccionales.</p>
    '
);

-- 7.2 Capas TÃ­picas
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    7, 
    '7.2 Capas TÃ­picas en Aplicaciones MÃ³viles', 
    '
    <p>Aunque varÃ­a segÃºn la complejidad, en aplicaciones mÃ³viles modernas (Android con Jetpack, iOS con SwiftUI) suelen existir las siguientes capas:</p>

    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ 1. Capa de PresentaciÃ³n</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Responsable de la UI, interacciÃ³n con el usuario (gestures, inputs) y renderizaciÃ³n. Ejemplos: Activities/Fragments, SwiftUI Views. No debe contener lÃ³gica de negocio compleja.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ 2. Capa de LÃ³gica de Negocio</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Reglas del sistema, workflows, validaciones y algoritmos. Orquesta operaciones como autenticaciÃ³n. Utiliza patrones como Command o Strategy.</p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ 3. Capa de Datos</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Acceso a DB locales (Room, Core Data), comunicaciÃ³n con APIs (Retrofit, URLSession) y persistencia. Encapsula detalles tÃ©cnicos de almacenamiento.</p>
        </div>
        
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #808080;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">ðŸ”¹ 4. Capa de Infraestructura (Opcional)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Seguridad, conectividad, push notifications, analytics y configuraciÃ³n del sistema (Dependency Injection). Envoltura para cross-cutting concerns.</p>
        </div>

    </div>

    <div class="highlight-box" style="margin-top: 2rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 8px;">
        <strong>ðŸ“Œ Flujo TÃ­pico:</strong> Ascendente (PresentaciÃ³n â†’ LÃ³gica â†’ Datos) para requests; Descendente (Datos â†’ LÃ³gica â†’ PresentaciÃ³n) para responses.
    </div>
    '
);

-- 7.3 RelaciÃ³n con Otras Arquitecturas
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    7, 
    '7.3 RelaciÃ³n con Otras Arquitecturas', 
    '
    <p>La arquitectura en capas es una <strong>base estructural</strong> sobre la cual se implementan patrones como MVC, MVP, MVVM y MVI.</p>

    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
        <ul style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;">
                <strong>RelaciÃ³n con MVC:</strong> La PresentaciÃ³n se alinea con Vista+Controlador; LÃ³gica con Modelo; Datos con Persistencia. El controlador actÃºa como puente.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>RelaciÃ³n con MVVM:</strong> PresentaciÃ³n es View; LÃ³gica de PresentaciÃ³n es ViewModel; Dominio/Datos es Model. MVVM es una especializaciÃ³n dentro de las capas.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>RelaciÃ³n con MVI:</strong> Capa de Estado (Modelo), Capa de Renderizado (Vista), Capa de Procesamiento (Reducer). Soporta flujos unidireccionales respetando la jerarquÃ­a.
            </li>
        </ul>
    </div>

    <p style="margin-top: 1rem;">No compite con estos patrones, sino que actÃºa como un nivel mÃ¡s general que los envuelve para asegurar consistencia y facilitar refactoring progresivo.</p>
    '
);

-- 7.4 Tabla de Ventajas y Desventajas (ChatGPT)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    7, 
    '7.4 Ventajas y Desventajas de la Arquitectura en Capas', 
    '
    <p>AnÃ¡lisis detallado de costos, implementaciÃ³n y evaluaciÃ³n de la Arquitectura Basada en Capas en aplicaciones mÃ³viles.</p>

    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px; text-align: left; width: 20%;">Aspecto</th>
                    <th style="padding: 15px; text-align: left; width: 40%; border-right: 1px solid rgba(255,255,255,0.2);">âœ… CuÃ¡ndo es Ventaja (y por quÃ©)</th>
                    <th style="padding: 15px; text-align: left; width: 40%;">âŒ CuÃ¡ndo es Desventaja (y por quÃ©)</th>
                </tr>
            </thead>
            <tbody>
                <!-- Fila 1 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Costo inicial de implementaciÃ³n</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Bajo a moderado. Su estructura por capas (presentaciÃ³n, lÃ³gica y datos) es fÃ¡cil de entender e implementar.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede requerir reorganizaciÃ³n posterior si la aplicaciÃ³n crece y necesita mayor independencia entre mÃ³dulos.
                    </td>
                </tr>
                <!-- Fila 2 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Infraestructura y herramientas</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Compatible con cualquier tecnologÃ­a o framework mÃ³vil sin requerir herramientas especiales.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        No impone reglas estrictas, lo que puede generar malas prÃ¡cticas si no se controla la comunicaciÃ³n entre capas.
                    </td>
                </tr>
                <!-- Fila 3 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Tiempo de desarrollo</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Desarrollo rÃ¡pido gracias a su estructura clara y tradicional.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Puede aumentar el tiempo cuando existen muchas dependencias entre capas.
                    </td>
                </tr>
                <!-- Fila 4 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Escalabilidad</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Funciona bien en aplicaciones pequeÃ±as y medianas con flujo de trabajo definido.
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
                        Cambios en una capa pueden afectar otras si no existe buena separaciÃ³n, aumentando costos de mantenimiento.
                    </td>
                </tr>
                <!-- Fila 6 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing (Pruebas)</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        Permite pruebas por capa (datos, lÃ³gica o presentaciÃ³n).
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        Las dependencias entre capas pueden dificultar pruebas completamente independientes.
                    </td>
                </tr>
                <!-- Fila 7 -->
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">ComparaciÃ³n con MVC/MVP</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        MÃ¡s general y flexible, sirve como base para otros patrones arquitectÃ³nicos.
                    </td>
                    <td style="padding: 15px; color: #ccc;">
                        MVC o MVP ofrecen roles mÃ¡s definidos para interfaces de usuario.
                    </td>
                </tr>
                <!-- Fila 8 -->
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">ComparaciÃ³n con Clean Architecture</td>
                    <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">
                        MÃ¡s sencilla y rÃ¡pida de implementar.
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

-- 1. Limpiar subtemas existentes del Tema 8 (ComparaciÃ³n)
DELETE FROM subtemas WHERE tema_id = 8;

-- 2. Insertar nuevo contenido para el Tema 8 (Comparativa)

-- 8.1 Criterios de comparaciÃ³n
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    8, 
    '8.1 Criterios de ComparaciÃ³n', 
    '
    <p>Para evaluar objetivamente las arquitecturas mÃ³viles, establecemos los siguientes criterios fundamentales:</p>
    
    <div class="criteria-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem; margin-top: 1rem;">
        <div class="criteria-card" style="background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 8px;">
            <h4 style="color: var(--accent-blue);">ðŸ“‰ Curva de Aprendizaje</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Dificultad inicial para el equipo.</p>
        </div>
        <div class="criteria-card" style="background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 8px;">
            <h4 style="color: var(--accent-purple);">ðŸ§ª Testabilidad</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Facilidad para escribir pruebas unitarias.</p>
        </div>
        <div class="criteria-card" style="background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 8px;">
            <h4 style="color: #00ff00);">ðŸš€ Escalabilidad</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Capacidad de crecer sin deuda tÃ©cnica.</p>
        </div>
        <div class="criteria-card" style="background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 8px;">
            <h4 style="color: #ffcc00);">ðŸ’° Costo Inicial</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Tiempo y esfuerzo para configurar el proyecto.</p>
        </div>
    </div>
    '
);

-- 8.2 ComparaciÃ³n Interactiva
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    8, 
    '8.2 Comparativa Visual: MVC vs MVP vs MVVM vs MVI', 
    '
    <p>A continuaciÃ³n se presentan grÃ¡ficos interactivos que comparan el rendimiento de cada arquitectura en aspectos clave.</p>

    <!-- Canvas para grÃ¡ficos -->
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
            // ConfiguraciÃ³n comÃºn
            Chart.defaults.color = "#ccc";
            Chart.defaults.borderColor = "#333";

            // GrÃ¡fico de Testabilidad (Bar)
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

            // GrÃ¡fico de Complejidad (Doughnut)
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

            // GrÃ¡fico de Radar General
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

-- 8.3 SelecciÃ³n de Arquitectura
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    8, 
    '8.3 SelecciÃ³n de Arquitectura', 
    '
    <p>Elegir la arquitectura correcta depende del contexto del proyecto. No existe una "bala de plata".</p>

    <div class="selection-guide" style="display: flex; flex-direction: column; gap: 1.5rem; margin-top: 2rem;">
        
        <div class="selection-item" style="border-left: 4px solid #4ade80; padding-left: 1rem;">
            <h4 style="color: #4ade80;">âœ… Elige MVC si...</h4>
            <p>EstÃ¡s creando un prototipo rÃ¡pido, una app muy simple con pocas pantallas, o estÃ¡s aprendiendo los conceptos bÃ¡sicos de desarrollo.</p>
        </div>

        <div class="selection-item" style="border-left: 4px solid #60a5fa; padding-left: 1rem;">
            <h4 style="color: #60a5fa;">âœ… Elige MVP si...</h4>
            <p>Necesitas alta testabilidad en un proyecto legacy o en un equipo que prefiere un estilo imperativo y control explÃ­cito sobre la vista.</p>
        </div>

        <div class="selection-item" style="border-left: 4px solid #facc15; padding-left: 1rem;">
            <h4 style="color: #facc15;">âœ… Elige MVVM si...</h4>
            <p>Usas frameworks modernos (Android Jetpack, SwiftUI), buscas aprovechar el Data Binding y quieres un equilibrio ideal entre estructura y complejidad.</p>
        </div>

        <div class="selection-item" style="border-left: 4px solid #f472b6; padding-left: 1rem;">
            <h4 style="color: #f472b6;">âœ… Elige MVI si...</h4>
            <p>Tu app tiene flujos de datos complejos, actualizaciones en tiempo real, mÃºltiples fuentes de verdad o requiere una trazabilidad absoluta de estados (ej. Apps bancarias).</p>
        </div>

        <div class="selection-item" style="border-left: 4px solid #a78bfa; padding-left: 1rem;">
            <h4 style="color: #a78bfa;">âœ… Elige Clean Architecture si...</h4>
            <p>El proyecto es de larga duraciÃ³n (aÃ±os), empresarial, grande, y requiere independencia total de frameworks y bases de datos. Se suele combinar con MVVM o MVI.</p>
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
                    <th style="padding: 15px;">ðŸ† Mejor Uso</th>
                    <th style="padding: 15px;">ðŸš« Peor Uso</th>
                    <th style="padding: 15px;">Palabra Clave</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">MVC</td>
                    <td style="padding: 15px;">Prototipos, Apps AcadÃ©micas</td>
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
                    <td style="padding: 15px;">EstÃ¡ndar de Industria, Apps Modernas</td>
                    <td style="padding: 15px;">Juegos, Apps triviales de 1 pantalla</td>
                    <td style="padding: 15px;"><em>Reactividad</em></td>
                </tr>
                <tr style="border-bottom: 1px solid #333; background: rgba(255,255,255,0.02);">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">MVI</td>
                    <td style="padding: 15px;">Alta concurrencia, Debugging crÃ­tico</td>
                    <td style="padding: 15px;">Equipos Junior, Proyectos con deadline corto</td>
                    <td style="padding: 15px;"><em>Previsibilidad</em></td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Clean Arch</td>
                    <td style="padding: 15px;">Proyectos de +5 aÃ±os, Multi-mÃ³dulo</td>
                    <td style="padding: 15px;">Startups en fase de validaciÃ³n (MVP)</td>
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
('Â¿CuÃ¡l es el objetivo principal de una arquitectura de software mÃ³vil?', 'Hacer que la app se vea bonita', 'Estructurar el sistema para facilitar mantenimiento y escalabilidad', 'Escribir menos cÃ³digo', 'Usar la Ãºltima tecnologÃ­a disponible', 'B', 'La arquitectura busca organizar el cÃ³digo para que sea mantenible, escalable y testable a largo plazo.'),

-- Topic 2: MVC
('En el patrÃ³n MVC, Â¿quÃ© componente es responsable de la lÃ³gica de negocio y los datos?', 'Vista (View)', 'Controlador (Controller)', 'Modelo (Model)', 'Usuario', 'C', 'El Modelo encapsula la lÃ³gica de negocio y el estado de la aplicaciÃ³n, independiente de la interfaz.'),
('Â¿CuÃ¡l es una desventaja comÃºn del patrÃ³n MVC en aplicaciones complejas?', 'Es demasiado difÃ­cil de aprender', 'El Controlador tiende a volverse masivo (Massive View Controller)', 'No permite usar bases de datos', 'La Vista no se puede actualizar', 'B', 'En apps grandes, el Controlador asume demasiadas responsabilidades, volviÃ©ndose difÃ­cil de mantener.'),

-- Topic 3: MVP
('En MVP, Â¿cÃ³mo se comunican la Vista y el Presentador?', 'Directamente accediendo a variables', 'A travÃ©s de interfaces (Contratos)', 'Mediante eventos del sistema operativo', 'No se comunican', 'B', 'MVP usa interfaces para desacoplar la Vista del Presentador, facilitando el testing.'),
('Â¿QuÃ© ventaja principal ofrece MVP sobre MVC para el testing?', 'No requiere escribir tests', 'Permite probar la lÃ³gica de presentaciÃ³n sin depender de la UI (Android/iOS)', 'Es mÃ¡s rÃ¡pido de compilar', 'Usa menos memoria', 'B', 'Al aislar la lÃ³gica en el Presentador (POJO), se pueden correr tests unitarios sin emuladores.'),

-- Topic 4: MVVM
('Â¿QuÃ© componente es clave en MVVM para conectar la Vista y el ViewModel?', 'El Controlador', 'Data Binding u Observables', 'Un archivo XML estÃ¡tico', 'Una base de datos SQL', 'B', 'El Data Binding o los patrones de observaciÃ³n (LiveData, StateFlow) permiten que la Vista reaccione automÃ¡ticamente a cambios en el ViewModel.'),
('Â¿CuÃ¡l es el rol del ViewModel en MVVM?', 'Dibujar los botones en pantalla', 'Guardar datos en el disco duro', 'Exponer el estado y manejar la lÃ³gica de presentaciÃ³n para la Vista', 'Validar transacciones bancarias', 'C', 'El ViewModel transforma los datos del Modelo para que la Vista los consuma y maneja el estado de la UI.'),

-- Topic 5: MVI
('Â¿QuÃ© caracterÃ­stica define al flujo de datos en MVI?', 'Es bidireccional y caÃ³tico', 'Es unidireccional y cÃ­clico (Intent -> Model -> View)', 'No hay flujo de datos', 'Depende del usuario', 'B', 'MVI impone un flujo estricto unidireccional donde los Intents generan nuevos estados inmutables.'),
('En MVI, el estado de la aplicaciÃ³n es...', 'Mutable y distribuido', 'Inmutable y centralizado', 'Opcional', 'Guardado solo en la nube', 'B', 'MVI trata el estado como inmutable; cada cambio genera una nueva instancia del estado completo.'),

-- Topic 6: Clean Architecture
('SegÃºn Clean Architecture, Â¿hacia dÃ³nde deben apuntar las dependencias?', 'Hacia afuera (Frameworks)', 'Hacia adentro (Reglas de Negocio/Dominio)', 'Hacia la base de datos', 'Aleatoriamente', 'B', 'La Regla de Dependencia establece que las capas externas dependen de las internas, nunca al revÃ©s.'),
('Â¿QuÃ© capa se encuentra en el centro de Clean Architecture?', 'Presentadores', 'Base de Datos', 'Entidades (Entities)', 'Interfaz de Usuario', 'C', 'Las Entidades encapsulan las reglas de negocio mÃ¡s generales y de alto nivel.'),

-- Topic 7: Layered Architecture
('En una arquitectura por capas tÃ­pica, la capa de presentaciÃ³n debe comunicarse directamente con...', 'La base de datos', 'La capa de lÃ³gica de negocio', 'La capa de infraestructura', 'Servicios externos', 'B', 'Para mantener la separaciÃ³n, la presentaciÃ³n habla con la lÃ³gica, y esta con los datos.'),

-- Topic 8: Comparison
('Si tienes un equipo junior y necesitas un prototipo rÃ¡pido para maÃ±ana, Â¿quÃ© arquitectura elegirÃ­as?', 'Clean Architecture', 'MVI', 'MVC', 'Microservicios', 'C', 'MVC es la mÃ¡s simple y rÃ¡pida de implementar para proyectos pequeÃ±os o prototipos.'),
('Â¿QuÃ© arquitectura es ideal para una app bancaria que requiere alta trazabilidad y cero errores de estado?', 'MVC', 'MVP', 'MVI', 'No importa', 'C', 'MVI ofrece un control de estado predecible y unidireccional, ideal para apps crÃ­ticas y complejas.');

-- 4. Insert Topic 9 into 'temas' if not exists (or update)
INSERT INTO `temas` (`id`, `titulo`, `descripcion`) VALUES (9, 'EvaluaciÃ³n de Conocimientos', 'Cuestionario interactivo para poner a prueba lo aprendido sobre arquitecturas mÃ³viles.')
ON DUPLICATE KEY UPDATE `titulo`='EvaluaciÃ³n de Conocimientos', `descripcion`='Cuestionario interactivo para poner a prueba lo aprendido sobre arquitecturas mÃ³viles.';

-- 5. Insert content for Topic 9 (The Quiz Interface)
DELETE FROM `subtemas` WHERE `tema_id` = 9;
INSERT INTO `subtemas` (`tema_id`, `titulo`, `contenido`) VALUES (
    9,
    '9.1 Cuestionario Final',
    '
    <div id="quiz-container" style="max-width: 800px; margin: 0 auto;">
        <div class="quiz-header" style="text-align: center; margin-bottom: 2rem;">
            <h3 style="color: var(--accent-blue);">ðŸ§  DesafÃ­o de Arquitectura</h3>
            <p>Responde las siguientes preguntas para validar tu dominio sobre los patrones.</p>
            <div id="score-display" style="font-size: 1.5rem; font-weight: bold; margin-top: 1rem; display: none;">
                PuntuaciÃ³n: <span id="score-value">0</span> / <span id="total-questions">0</span>
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
                                    feedback.innerHTML = `<strong style="color: #4ade80;">Â¡Correcto!</strong> ${q.explanation}`;
                                    updateScore(1);
                                } else {
                                    feedback.style.backgroundColor = "rgba(255, 0, 0, 0.2)";
                                    feedback.style.border = "1px solid #ff0000";
                                    feedback.innerHTML = `<strong style="color: #f87171;">Incorrecto.</strong> La respuesta correcta era la opciÃ³n ${q.correct_option}.<br><br>${q.explanation}`;
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
