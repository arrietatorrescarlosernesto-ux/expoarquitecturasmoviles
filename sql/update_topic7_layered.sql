
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
