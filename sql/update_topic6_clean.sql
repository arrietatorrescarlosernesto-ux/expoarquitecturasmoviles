
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
