
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
