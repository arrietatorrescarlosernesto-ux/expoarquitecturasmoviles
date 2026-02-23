
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
