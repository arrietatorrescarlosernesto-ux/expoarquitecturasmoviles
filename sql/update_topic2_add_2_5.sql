
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
