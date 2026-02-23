
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
