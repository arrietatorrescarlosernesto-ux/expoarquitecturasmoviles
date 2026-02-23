
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
('¿Cuál es el objetivo principal de una arquitectura de software móvil?', 'Hacer que la app se vea bonita', 'Estructurar el sistema para facilitar mantenimiento y escalabilidad', 'Escribir menos código', 'Usar la última tecnología disponible', 'B', 'La arquitectura busca organizar el código para que sea mantenible, escalable y testable a largo plazo.'),

-- Topic 2: MVC
('En el patrón MVC, ¿qué componente es responsable de la lógica de negocio y los datos?', 'Vista (View)', 'Controlador (Controller)', 'Modelo (Model)', 'Usuario', 'C', 'El Modelo encapsula la lógica de negocio y el estado de la aplicación, independiente de la interfaz.'),
('¿Cuál es una desventaja común del patrón MVC en aplicaciones complejas?', 'Es demasiado difícil de aprender', 'El Controlador tiende a volverse masivo (Massive View Controller)', 'No permite usar bases de datos', 'La Vista no se puede actualizar', 'B', 'En apps grandes, el Controlador asume demasiadas responsabilidades, volviéndose difícil de mantener.'),

-- Topic 3: MVP
('En MVP, ¿cómo se comunican la Vista y el Presentador?', 'Directamente accediendo a variables', 'A través de interfaces (Contratos)', 'Mediante eventos del sistema operativo', 'No se comunican', 'B', 'MVP usa interfaces para desacoplar la Vista del Presentador, facilitando el testing.'),
('¿Qué ventaja principal ofrece MVP sobre MVC para el testing?', 'No requiere escribir tests', 'Permite probar la lógica de presentación sin depender de la UI (Android/iOS)', 'Es más rápido de compilar', 'Usa menos memoria', 'B', 'Al aislar la lógica en el Presentador (POJO), se pueden correr tests unitarios sin emuladores.'),

-- Topic 4: MVVM
('¿Qué componente es clave en MVVM para conectar la Vista y el ViewModel?', 'El Controlador', 'Data Binding u Observables', 'Un archivo XML estático', 'Una base de datos SQL', 'B', 'El Data Binding o los patrones de observación (LiveData, StateFlow) permiten que la Vista reaccione automáticamente a cambios en el ViewModel.'),
('¿Cuál es el rol del ViewModel en MVVM?', 'Dibujar los botones en pantalla', 'Guardar datos en el disco duro', 'Exponer el estado y manejar la lógica de presentación para la Vista', 'Validar transacciones bancarias', 'C', 'El ViewModel transforma los datos del Modelo para que la Vista los consuma y maneja el estado de la UI.'),

-- Topic 5: MVI
('¿Qué característica define al flujo de datos en MVI?', 'Es bidireccional y caótico', 'Es unidireccional y cíclico (Intent -> Model -> View)', 'No hay flujo de datos', 'Depende del usuario', 'B', 'MVI impone un flujo estricto unidireccional donde los Intents generan nuevos estados inmutables.'),
('En MVI, el estado de la aplicación es...', 'Mutable y distribuido', 'Inmutable y centralizado', 'Opcional', 'Guardado solo en la nube', 'B', 'MVI trata el estado como inmutable; cada cambio genera una nueva instancia del estado completo.'),

-- Topic 6: Clean Architecture
('Según Clean Architecture, ¿hacia dónde deben apuntar las dependencias?', 'Hacia afuera (Frameworks)', 'Hacia adentro (Reglas de Negocio/Dominio)', 'Hacia la base de datos', 'Aleatoriamente', 'B', 'La Regla de Dependencia establece que las capas externas dependen de las internas, nunca al revés.'),
('¿Qué capa se encuentra en el centro de Clean Architecture?', 'Presentadores', 'Base de Datos', 'Entidades (Entities)', 'Interfaz de Usuario', 'C', 'Las Entidades encapsulan las reglas de negocio más generales y de alto nivel.'),

-- Topic 7: Layered Architecture
('En una arquitectura por capas típica, la capa de presentación debe comunicarse directamente con...', 'La base de datos', 'La capa de lógica de negocio', 'La capa de infraestructura', 'Servicios externos', 'B', 'Para mantener la separación, la presentación habla con la lógica, y esta con los datos.'),

-- Topic 8: Comparison
('Si tienes un equipo junior y necesitas un prototipo rápido para mañana, ¿qué arquitectura elegirías?', 'Clean Architecture', 'MVI', 'MVC', 'Microservicios', 'C', 'MVC es la más simple y rápida de implementar para proyectos pequeños o prototipos.'),
('¿Qué arquitectura es ideal para una app bancaria que requiere alta trazabilidad y cero errores de estado?', 'MVC', 'MVP', 'MVI', 'No importa', 'C', 'MVI ofrece un control de estado predecible y unidireccional, ideal para apps críticas y complejas.');

-- 4. Insert Topic 9 into 'temas' if not exists (or update)
INSERT INTO `temas` (`id`, `titulo`, `descripcion`) VALUES (9, 'Evaluación de Conocimientos', 'Cuestionario interactivo para poner a prueba lo aprendido sobre arquitecturas móviles.')
ON DUPLICATE KEY UPDATE `titulo`='Evaluación de Conocimientos', `descripcion`='Cuestionario interactivo para poner a prueba lo aprendido sobre arquitecturas móviles.';

-- 5. Insert content for Topic 9 (The Quiz Interface)
DELETE FROM `subtemas` WHERE `tema_id` = 9;
INSERT INTO `subtemas` (`tema_id`, `titulo`, `contenido`) VALUES (
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
    </script>
    '
);
