
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

-- Dumping data for table `subtemas`

-- TEMA 1
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES
(1, '1.1 Arquitectura de software en aplicaciones móviles', '
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
<p>Su función principal es establecer la base conceptual para construir sistemas escalables y mantenibles. Actúa como un "plano" que simplifica el desarrollo y permite enfrentar cambios constantes en el ecosistema móvil.</p>
<div class="highlight-box" style="border: 1px dashed var(--accent-blue); padding: 1rem; border-radius: 8px; margin-top: 1rem; background: rgba(0, 198, 255, 0.05);">
    <strong>Resumen:</strong> La arquitectura móvil no solo organiza el código, sino que alinea el diseño con factores determinantes como requisitos funcionales y no funcionales.
</div>'),
(1, '1.2 Objetivos de una arquitectura móvil', '
<p>Los objetivos se centran en optimizar el desarrollo y el ciclo de vida de la aplicación:</p>
<div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🧩 Organización del Código</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Facilita una estructura modular y clara, reduciendo la complejidad.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #0072ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🛠️ Mantenimiento</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Código más limpio, fácil de actualizar y corregir.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">📈 Escalabilidad</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Asegura que la aplicación pueda crecer sin reescrituras masivas.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🎭 Separación de Responsabilidades</h4>
        <p style="font-size: 0.9rem; color: #aaa;">Divide el sistema en componentes independientes (lógica, interfaz, datos).</p>
    </div>
</div>');

-- TEMA 2
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES
(2, '2.1 Definición de MVC', '
<div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
    <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Concepto Clave</h4>
    <p><strong>MVC (Model-View-Controller)</strong> divide la aplicación en: <strong>Modelo</strong>, <strong>Vista</strong> y <strong>Controlador</strong>, separando la lógica de negocio de la interfaz.</p>
</div>
<p>Originado en los 70, es ampliamente usado en móvil (Android Activities, iOS ViewControllers). El flujo típico: View → Controller → Model → Controller → View.</p>
<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="images/MVC3.webp" alt="Diagrama Ilustrativo de MVC" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
    <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama Ilustrativo de MVC</p>
</div>'),
(2, '2.2 Componentes de MVC', '
<div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">📦 Modelo (Model)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Gestiona datos y lógica de negocio. Representa entidades del mundo real.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">👁️ Vista (View)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Interfaz de usuario. Presenta datos y maneja interacciones visuales.</p>
    </div>
    <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
        <h4 style="color: #fff; margin-bottom: 0.5rem;">🎮 Controlador (Controller)</h4>
        <p style="font-size: 0.9rem; color: #ccc;">Intermediario. Procesa entradas del usuario, actualiza el Modelo y refresca la Vista.</p>
    </div>
</div>'),
(2, '2.3 Flujo de Comunicación en MVC', '
<p>El flujo es unidireccional y cíclico:</p>
<div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
    <ol style="margin-left: 1.5rem; color: #e0e0e0;">
        <li style="margin-bottom: 1rem;"><strong>Acción:</strong> Usuario interactúa con la Vista.</li>
        <li style="margin-bottom: 1rem;"><strong>Procesamiento:</strong> Controlador recibe evento y decide qué hacer.</li>
        <li style="margin-bottom: 1rem;"><strong>Modelo:</strong> Se actualiza si es necesario.</li>
        <li style="margin-bottom: 1rem;"><strong>Refresco:</strong> Controlador actualiza la Vista con nuevos datos.</li>
    </ol>
</div>
<div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
    <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=mvc%20architecture%20communication%20flow%20diagram%20user%20action%20controller%20model%20view%20cycle%20neon%20tech&image_size=landscape_16_9" alt="Diagrama de Flujo MVC" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
</div>'),
(2, '2.4 Aplicación de MVC en Entornos Móviles', '
<div class="platform-comparison" style="display: flex; flex-direction: column; gap: 2rem; margin-top: 2rem;">
    <div class="android-section" style="border-left: 4px solid #3ddc84; padding-left: 1.5rem;">
        <h3 style="color: #3ddc84;">🤖 Android</h3>
        <p>Activities/Fragments actúan como Controladores. XML layouts son Vistas.</p>
    </div>
    <div class="ios-section" style="border-left: 4px solid #007aff; padding-left: 1.5rem;">
        <h3 style="color: #007aff;">🍎 iOS</h3>
        <p>UIViewController combina Vista y Controlador. Modelos son clases separadas.</p>
    </div>
</div>'),
(2, '2.5 Análisis de Costos y Evaluación de MVC', '
<div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
    <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
        <thead>
            <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                <th style="padding: 15px; width: 25%;">Aspecto</th>
                <th style="padding: 15px; width: 37.5%; border-right: 1px solid rgba(255,255,255,0.2);">✅ Ventajas</th>
                <th style="padding: 15px; width: 37.5%;">❌ Desventajas</th>
            </tr>
        </thead>
        <tbody>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Concepto General</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Simple y fácil de comprender.</td>
                <td style="padding: 15px; color: #ccc;">Complejo en apps grandes.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Aprendizaje</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Ideal para principiantes.</td>
                <td style="padding: 15px; color: #ccc;">Requiere disciplina al crecer.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Implementación</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Rápida en MVPs.</td>
                <td style="padding: 15px; color: #ccc;">Estructura monolítica en proyectos grandes.</td>
            </tr>
            <tr style="border-bottom: 1px solid #333;">
                <td style="padding: 15px; font-weight: bold; color: var(--accent-blue);">Testing</td>
                <td style="padding: 15px; border-right: 1px solid #333; color: #ccc;">Unitarias sencillas para el Modelo.</td>
                <td style="padding: 15px; color: #ccc;">Difícil probar UI/Controlador (alto acoplamiento).</td>
            </tr>
        </tbody>
    </table>
</div>');

-- TEMA 3 (MVP)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    3, 
    '3.1 Definición y Concepto de MVP', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">¿Qué es MVP?</h4>
        <p><strong>MVP (Model-View-Presenter)</strong> es un patrón derivado de MVC, diseñado para facilitar pruebas unitarias y separar responsabilidades. El <strong>Presentador</strong> actúa como intermediario estricto; la Vista es pasiva y no conoce al Modelo.</p>
    </div>
    <div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
        <img src="images/mvp.png" alt="Diagrama de Arquitectura MVP" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
    </div>'
), (
    3, 
    '3.2 Componentes Principales', 
    '
    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">📦 Modelo</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Datos y lógica de negocio. Idéntico a MVC.</p>
        </div>
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">👁️ Vista</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Interfaz pasiva. Implementa una interfaz que el Presentador usa.</p>
        </div>
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🎤 Presentador</h4>
            <p style="font-size: 0.9rem; color: #ccc;">El "cerebro". Recibe eventos de la Vista, pide datos al Modelo y actualiza la Vista.</p>
        </div>
    </div>'
), (
    3, 
    '3.5 Análisis de Costos y Evaluación', 
    '
    <p>Comparativa MVP vs otros patrones.</p>
    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px;">Aspecto</th>
                    <th style="padding: 15px; border-right: 1px solid #444;">✅ Ventaja</th>
                    <th style="padding: 15px;">❌ Desventaja</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; color: var(--accent-blue);">Testing</td>
                    <td style="padding: 15px; border-right: 1px solid #333;">Gran ventaja. Presentador testable unitariamente.</td>
                    <td style="padding: 15px;">Requiere configuración de Mocks.</td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; color: var(--accent-blue);">Mantenimiento</td>
                    <td style="padding: 15px; border-right: 1px solid #333;">Separa lógica de vista claramente.</td>
                    <td style="padding: 15px;">Verbosidad (muchas interfaces).</td>
                </tr>
            </tbody>
        </table>
    </div>'
);

-- TEMA 4 (MVVM)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    4, 
    '4.1 Definición de MVVM', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición Ampliada</h4>
        <p><strong>MVVM (Model-View-ViewModel)</strong> desacopla la lógica de presentación y la UI mediante un <strong>ViewModel</strong> y <strong>Data Binding</strong>.</p>
    </div>
    <p>Ideal para entornos con programación reactiva. Las actualizaciones de datos se propagan automáticamente a la interfaz.</p>'
), (
    4, 
    '4.2 Componentes de MVVM', 
    '
    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 Model</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Capa de dominio y datos. Independiente de la UI.</p>
        </div>
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 View</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Renderiza datos y captura eventos. Se suscribe al ViewModel. Rol pasivo.</p>
        </div>
        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🔹 ViewModel</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Transforma datos para la View. Gestiona estados (carga, éxito, error). No conoce a la View.</p>
        </div>
    </div>'
), (
    4, 
    '4.5 Análisis de Costos', 
    '
    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px;">Aspecto</th>
                    <th style="padding: 15px; border-right: 1px solid #444;">✅ Ventaja</th>
                    <th style="padding: 15px;">❌ Desventaja</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; color: var(--accent-blue);">Implementación</td>
                    <td style="padding: 15px; border-right: 1px solid #333;">Automatiza UI con Data Binding.</td>
                    <td style="padding: 15px;">Curva de aprendizaje inicial alta.</td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; color: var(--accent-blue);">Testing</td>
                    <td style="padding: 15px; border-right: 1px solid #333;">ViewModel testable sin UI.</td>
                    <td style="padding: 15px;">Complejidad en pruebas reactivas.</td>
                </tr>
            </tbody>
        </table>
    </div>'
);

-- TEMA 5 (MVI)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    5, 
    '5.1 Definición de MVI', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición Ampliada</h4>
        <p><strong>MVI (Model-View-Intent)</strong> se centra en <strong>estados inmutables</strong> y <strong>flujo unidireccional</strong>. Las acciones son <em>intents</em> que crean nuevos estados.</p>
    </div>
    <p>Basado en programación reactiva y funcional. Garantiza previsibilidad y trazabilidad.</p>'
), (
    5, 
    '5.5 Ventajas y Desventajas', 
    '
    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px;">Aspecto</th>
                    <th style="padding: 15px; border-right: 1px solid #444;">✅ Ventaja</th>
                    <th style="padding: 15px;">❌ Desventaja</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; color: var(--accent-blue);">Flujo de Datos</td>
                    <td style="padding: 15px; border-right: 1px solid #333;">Unidireccional y predecible.</td>
                    <td style="padding: 15px;">Mucho código boilerplate.</td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; color: var(--accent-blue);">Debugging</td>
                    <td style="padding: 15px; border-right: 1px solid #333;">Excelente trazabilidad (Time-travel).</td>
                    <td style="padding: 15px;">Alta complejidad conceptual.</td>
                </tr>
            </tbody>
        </table>
    </div>'
);

-- TEMA 6 (Clean Architecture)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    6, 
    '6.1 Definición de Clean Architecture', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Concepto</h4>
        <p><strong>Clean Architecture</strong> organiza el software en <strong>capas concéntricas</strong>, priorizando la independencia del dominio respecto a frameworks y detalles externos.</p>
    </div>
    <p>Reglas de negocio al centro, dependencias apuntando hacia adentro (DIP).</p>'
), (
    6, 
    '6.5 Ventajas y Desventajas', 
    '
    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px;">Aspecto</th>
                    <th style="padding: 15px; border-right: 1px solid #444;">✅ Ventaja</th>
                    <th style="padding: 15px;">❌ Desventaja</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; color: var(--accent-blue);">Mantenimiento</td>
                    <td style="padding: 15px; border-right: 1px solid #333;">Facilita cambios sin afectar el núcleo.</td>
                    <td style="padding: 15px;">Alto costo inicial y complejidad.</td>
                </tr>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; color: var(--accent-blue);">Independencia</td>
                    <td style="padding: 15px; border-right: 1px solid #333;">Totalmente agnóstico de frameworks.</td>
                    <td style="padding: 15px;">Overkill para apps pequeñas.</td>
                </tr>
            </tbody>
        </table>
    </div>'
);

-- TEMA 7 (Layered)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    7, 
    '7.1 Definición de Arquitectura en Capas', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Definición</h4>
        <p>Organiza la aplicación en niveles jerárquicos (Presentación, Lógica, Datos). Cada capa solo interactúa con sus adyacentes.</p>
    </div>'
), (
    7, 
    '7.4 Ventajas y Desventajas', 
    '
    <div class="table-responsive" style="overflow-x: auto; margin-bottom: 2rem; border-radius: 8px; border: 1px solid #333;">
        <table style="width: 100%; border-collapse: collapse; min-width: 700px; font-size: 0.95rem;">
            <thead>
                <tr style="background: linear-gradient(90deg, var(--accent-blue), var(--accent-purple)); color: white;">
                    <th style="padding: 15px;">Aspecto</th>
                    <th style="padding: 15px; border-right: 1px solid #444;">✅ Ventaja</th>
                    <th style="padding: 15px;">❌ Desventaja</th>
                </tr>
            </thead>
            <tbody>
                <tr style="border-bottom: 1px solid #333;">
                    <td style="padding: 15px; color: var(--accent-blue);">Implementación</td>
                    <td style="padding: 15px; border-right: 1px solid #333;">Fácil de entender y aplicar.</td>
                    <td style="padding: 15px;">Puede generar acoplamiento si no se cuida.</td>
                </tr>
            </tbody>
        </table>
    </div>'
);

-- TEMA 8 (Comparación)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    8, 
    '8.1 Criterios de Comparación', 
    '
    <div class="criteria-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem; margin-top: 1rem;">
        <div class="criteria-card" style="background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 8px;">
            <h4 style="color: var(--accent-blue);">📉 Curva de Aprendizaje</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Dificultad inicial para el equipo.</p>
        </div>
        <div class="criteria-card" style="background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 8px;">
            <h4 style="color: var(--accent-purple);">🧪 Testabilidad</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Facilidad para escribir pruebas unitarias.</p>
        </div>
    </div>'
), (
    8, 
    '8.2 Comparativa Visual', 
    '
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
    </script>'
), (
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
                    <td style="padding: 15px;">Frameworks Declarativos</td>
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
    </div>'
);

-- TEMA 9 (Cuestionario)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
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
        <form id="quiz-form" style="display: none;"></form>
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
                                <label class="quiz-option" style="display: block; padding: 10px; background: rgba(255,255,255,0.05); border-radius: 5px; cursor: pointer;"><input type="radio" name="q${q.id}" value="A"> ${q.option_a}</label>
                                <label class="quiz-option" style="display: block; padding: 10px; background: rgba(255,255,255,0.05); border-radius: 5px; cursor: pointer;"><input type="radio" name="q${q.id}" value="B"> ${q.option_b}</label>
                                <label class="quiz-option" style="display: block; padding: 10px; background: rgba(255,255,255,0.05); border-radius: 5px; cursor: pointer;"><input type="radio" name="q${q.id}" value="C"> ${q.option_c}</label>
                                <label class="quiz-option" style="display: block; padding: 10px; background: rgba(255,255,255,0.05); border-radius: 5px; cursor: pointer;"><input type="radio" name="q${q.id}" value="D"> ${q.option_d}</label>
                            </div>
                            <div class="feedback" id="feedback-${q.id}" style="display: none; margin-top: 1rem; padding: 1rem; border-radius: 5px;"></div>
                        `;
                        form.appendChild(qDiv);
                        const inputs = qDiv.querySelectorAll("input[type=radio]");
                        inputs.forEach(input => {
                            input.addEventListener("change", function() {
                                const selected = this.value;
                                const feedback = document.getElementById(`feedback-${q.id}`);
                                const isCorrect = selected === q.correct_option;
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
    </script>'
);

-- Insert Quiz Questions
INSERT INTO `quiz_questions` (`question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `explanation`) VALUES
('¿Cuál es el objetivo principal de una arquitectura de software móvil?', 'Hacer que la app se vea bonita', 'Estructurar el sistema para facilitar mantenimiento y escalabilidad', 'Escribir menos código', 'Usar la última tecnología disponible', 'B', 'La arquitectura busca organizar el código para que sea mantenible, escalable y testable a largo plazo.'),
('En el patrón MVC, ¿qué componente es responsable de la lógica de negocio y los datos?', 'Vista (View)', 'Controlador (Controller)', 'Modelo (Model)', 'Usuario', 'C', 'El Modelo encapsula la lógica de negocio y el estado de la aplicación, independiente de la interfaz.'),
('¿Cuál es una desventaja común del patrón MVC en aplicaciones complejas?', 'Es demasiado difícil de aprender', 'El Controlador tiende a volverse masivo (Massive View Controller)', 'No permite usar bases de datos', 'La Vista no se puede actualizar', 'B', 'En apps grandes, el Controlador asume demasiadas responsabilidades, volviéndose difícil de mantener.'),
('En MVP, ¿cómo se comunican la Vista y el Presentador?', 'Directamente accediendo a variables', 'A través de interfaces (Contratos)', 'Mediante eventos del sistema operativo', 'No se comunican', 'B', 'MVP usa interfaces para desacoplar la Vista del Presentador, facilitando el testing.'),
('¿Qué ventaja principal ofrece MVP sobre MVC para el testing?', 'No requiere escribir tests', 'Permite probar la lógica de presentación sin depender de la UI (Android/iOS)', 'Es más rápido de compilar', 'Usa menos memoria', 'B', 'Al aislar la lógica en el Presentador (POJO), se pueden correr tests unitarios sin emuladores.'),
('¿Qué componente es clave en MVVM para conectar la Vista y el ViewModel?', 'El Controlador', 'Data Binding u Observables', 'Un archivo XML estático', 'Una base de datos SQL', 'B', 'El Data Binding o los patrones de observación (LiveData, StateFlow) permiten que la Vista reaccione automáticamente a cambios en el ViewModel.'),
('¿Cuál es el rol del ViewModel en MVVM?', 'Dibujar los botones en pantalla', 'Guardar datos en el disco duro', 'Exponer el estado y manejar la lógica de presentación para la Vista', 'Validar transacciones bancarias', 'C', 'El ViewModel transforma los datos del Modelo para que la Vista los consuma y maneja el estado de la UI.'),
('¿Qué característica define al flujo de datos en MVI?', 'Es bidireccional y caótico', 'Es unidireccional y cíclico (Intent -> Model -> View)', 'No hay flujo de datos', 'Depende del usuario', 'B', 'MVI impone un flujo estricto unidireccional donde los Intents generan nuevos estados inmutables.'),
('En MVI, el estado de la aplicación es...', 'Mutable y distribuido', 'Inmutable y centralizado', 'Opcional', 'Guardado solo en la nube', 'B', 'MVI trata el estado como inmutable; cada cambio genera una nueva instancia del estado completo.'),
('Según Clean Architecture, ¿hacia dónde deben apuntar las dependencias?', 'Hacia afuera (Frameworks)', 'Hacia adentro (Reglas de Negocio/Dominio)', 'Hacia la base de datos', 'Aleatoriamente', 'B', 'La Regla de Dependencia establece que las capas externas dependen de las internas, nunca al revés.'),
('¿Qué capa se encuentra en el centro de Clean Architecture?', 'Presentadores', 'Base de Datos', 'Entidades (Entities)', 'Interfaz de Usuario', 'C', 'Las Entidades encapsulan las reglas de negocio más generales y de alto nivel.'),
('En una arquitectura por capas típica, la capa de presentación debe comunicarse directamente con...', 'La base de datos', 'La capa de lógica de negocio', 'La capa de infraestructura', 'Servicios externos', 'B', 'Para mantener la separación, la presentación habla con la lógica, y esta con los datos.'),
('Si tienes un equipo junior y necesitas un prototipo rápido para mañana, ¿qué arquitectura elegirías?', 'Clean Architecture', 'MVI', 'MVC', 'Microservicios', 'C', 'MVC es la más simple y rápida de implementar para proyectos pequeños o prototipos.'),
('¿Qué arquitectura es ideal para una app bancaria que requiere alta trazabilidad y cero errores de estado?', 'MVC', 'MVP', 'MVI', 'No importa', 'C', 'MVI ofrece un control de estado predecible y unidireccional, ideal para apps críticas y complejas.');
