
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
