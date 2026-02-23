-- Script de corrección de contenido e imágenes
-- Este script asegura que el contenido se inserte correctamente, incluso si los temas 7 y 8 estaban vacíos.

USE mobile_architectures;

-- 1. Limpiar subtemas de los temas afectados para evitar duplicados y asegurar una inserción limpia
DELETE FROM subtemas WHERE tema_id IN (1, 7, 8);

-- 2. Insertar contenido actualizado para Tema 1 (Introducción)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES
(1, '1.1 Arquitectura de software en aplicaciones móviles', '
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
'),
(1, '1.2 Objetivos de una arquitectura móvil', '
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
');

-- 3. Insertar contenido para Tema 7 (Arquitectura en capas)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES
(7, '7.1 Principios y Capas Recomendadas', '
<h4 style="color: var(--accent-blue);">Estructura en Capas</h4>
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
');

-- 4. Insertar contenido para Tema 8 (Comparación)
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES
(8, '8.1 Comparativa de Arquitecturas', '
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
    <h4 style="color: #fff;">Clean Architecture</h4>
    <p>Basada en capas independientes con el núcleo en entidades de negocio.</p>
    <div style="text-align: center; margin: 1rem 0;">
        <img src="images/CleanArchitecture.jpg" alt="Diagrama Clean Architecture" style="max-width: 80%; border-radius: 8px; border: 1px solid #333;">
    </div>
</div>
');
