document.addEventListener('DOMContentLoaded', () => {
    // 1. Fetch Data
    fetch('data.json')
        .then(response => response.json())
        .then(data => {
            initApp(data);
        })
        .catch(err => {
            console.error('Error loading data:', err);
            document.querySelector('.content').innerHTML = '<p style="color:red; padding:2rem;">Error cargando la base de datos. Asegúrate de que data.json existe.</p>';
        });
});

function initApp(db) {
    renderSidebar(db.topics);
    
    // Determine current page type based on elements presence
    const contentArea = document.getElementById('content-area');
    const heroSection = document.getElementById('hero-section');
    
    if (contentArea) {
        const urlParams = new URLSearchParams(window.location.search);
        let topicId = parseInt(urlParams.get('id'));
        
        if (topicId) {
            loadTopic(topicId, db);
        } else {
            // Default to ID 1 if not specified? 
            // Or show error.
            contentArea.innerHTML = '<div style="text-align:center; padding: 2rem;"><h2>Selecciona un tema del menú</h2><p>← Utiliza la barra lateral para navegar.</p></div>';
        }
    } else if (heroSection) {
        renderHome(db.topics);
    }
}

function renderSidebar(topics) {
    const list = document.getElementById('sidebar-list');
    if (!list) return;
    
    list.innerHTML = '';
    
    // Add Home Link
    const homeLi = document.createElement('li');
    const homeLink = document.createElement('a');
    homeLink.href = 'index.html';
    homeLink.textContent = '🏠 Inicio';
    
    // Check if we are on index page
    const isIndex = document.getElementById('hero-section') !== null;
    if (isIndex) {
        homeLink.classList.add('active');
    }
    homeLi.appendChild(homeLink);
    list.appendChild(homeLi);

    // Add Topics
    const urlParams = new URLSearchParams(window.location.search);
    const currentId = urlParams.has('id') ? parseInt(urlParams.get('id')) : null;
    
    topics.forEach(topic => {
        const li = document.createElement('li');
        const a = document.createElement('a');
        a.href = `topic.html?id=${topic.id}`;
        a.textContent = `${topic.id}. ${topic.title}`;
        
        if (currentId === parseInt(topic.id)) {
            a.classList.add('active');
        }
        
        li.appendChild(a);
        list.appendChild(li);
    });
}

function renderHome(topics) {
    const heroSection = document.getElementById('hero-section');
    if (!heroSection) return;

    // Keep existing Hero content
    // Append Topics Grid
    const gridContainer = document.createElement('div');
    gridContainer.className = 'topics-grid';
    gridContainer.style.display = 'grid';
    gridContainer.style.gridTemplateColumns = 'repeat(auto-fill, minmax(300px, 1fr))';
    gridContainer.style.gap = '2rem';
    gridContainer.style.marginTop = '4rem';

    topics.forEach(topic => {
        const card = document.createElement('div');
        card.className = 'card topic-card';
        card.style.cursor = 'pointer';
        card.onclick = () => window.location.href = `topic.html?id=${topic.id}`;
        
        card.innerHTML = `
            <h3 style="color: var(--accent-blue); margin-bottom: 1rem;">${topic.id}. ${topic.title}</h3>
            <p style="color: #aaa; font-size: 0.9rem;">${topic.description}</p>
            <div style="margin-top: 1rem; text-align: right;">
                <span style="color: var(--accent-purple); font-weight: bold; font-size: 0.8rem;">Leer más →</span>
            </div>
        `;
        gridContainer.appendChild(card);
    });

    // Insert after features grid if exists, or append to hero-section
    const featuresGrid = heroSection.querySelector('.features-grid');
    if (featuresGrid) {
        heroSection.insertBefore(gridContainer, featuresGrid.nextSibling);
    } else {
        heroSection.appendChild(gridContainer);
    }
}

function loadTopic(id, db) {
    const topic = db.topics.find(t => parseInt(t.id) === id);
    const container = document.getElementById('content-area');
    
    if (!topic) {
        container.innerHTML = '<h2>Tema no encontrado</h2><p>El ID solicitado no existe en la base de datos.</p>';
        return;
    }

    // Special handler for Quiz (Topic 9 usually)
    if (topic.title.toLowerCase().includes('cuestionario') || id === 9) {
        renderQuiz(topic, db.quiz, container);
    } else {
        renderStandardTopic(topic, container);
    }

    // Navigation Buttons
    setupNavigation(id, db.topics);
}

function renderStandardTopic(topic, container) {
    document.title = `${topic.title} - Arquitecturas Móviles`;
    let html = `
        <div class="topic-header fade-in">
            <span class="topic-badge">Tema ${topic.id}</span>
            <h1>${topic.title}</h1>
            <p class="topic-description">${topic.description}</p>
        </div>
        <div class="topic-content">
    `;

    topic.subtopics.forEach((sub, index) => {
        html += `
            <div class="subtopic-card slide-up" style="animation-delay: ${index * 0.1}s">
                <h3>${sub.title}</h3>
                <div class="subtopic-body">
                    ${sub.content}
                </div>
            </div>
        `;
    });

    html += `
        <div style="text-align: center; margin-top: 3rem;">
            <a href="index.html" style="
                display: inline-block;
                padding: 10px 30px;
                background: #333;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                border: 1px solid #555;
            ">Volver al Inicio</a>
        </div>
    </div>`;
    container.innerHTML = html;
    
    // Execute scripts if any embedded in content (like charts)
    executeScripts(container);
}

function renderQuiz(topic, questions, container) {
    document.title = `${topic.title} - Evaluación`;
    let html = `
        <div class="topic-header fade-in">
            <span class="topic-badge">Evaluación</span>
            <h1>${topic.title}</h1>
            <p class="topic-description">${topic.description}</p>
        </div>
        
        <div id="quiz-container" style="max-width: 800px; margin: 0 auto;">
            <div id="quiz-interface">
                <!-- Quiz populated here -->
            </div>
        </div>
    `;
    
    container.innerHTML = html;
    
    // If the topic content has the static HTML for quiz, use that, otherwise build it
    if (topic.subtopics.length > 0 && topic.subtopics[0].content.includes('quiz-form')) {
        const quizContentDiv = document.createElement('div');
        quizContentDiv.innerHTML = topic.subtopics[0].content;
        
        document.getElementById('quiz-interface').appendChild(quizContentDiv);
        
        // Populate questions
        const form = document.getElementById('quiz-form');
        if (form) {
            const submitBtnDiv = form.querySelector('div[style*="text-align: center"]');
            
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
                `;
                form.insertBefore(qDiv, submitBtnDiv);
            });
            
            document.getElementById("btn-submit").addEventListener("click", () => calculateResults(questions));
            document.getElementById("loading-quiz").style.display = 'none';
            form.style.display = 'block';
        }
    }
}

function calculateResults(questions) {
    let score = 0;
    const resultsDiv = document.getElementById("results-details");
    if(!resultsDiv) return;
    
    resultsDiv.innerHTML = "";
    
    questions.forEach((q, index) => {
        const selected = document.querySelector(`input[name="q${q.id}"]:checked`);
        const userVal = selected ? selected.value : null;
        const isCorrect = userVal === q.correct_option;
        
        if (isCorrect) score++;

        let tips = [];
        try {
            tips = JSON.parse(q.tips);
        } catch(e) { tips = ["Consejo no disponible."]; }
        const randomTip = tips.length > 0 ? tips[Math.floor(Math.random() * tips.length)] : "";

        const resultItem = document.createElement("div");
        resultItem.style.marginBottom = "2rem";
        resultItem.style.padding = "1rem";
        resultItem.style.borderLeft = isCorrect ? "4px solid #4ade80" : "4px solid #f87171";
        resultItem.style.background = "rgba(255,255,255,0.02)";
        resultItem.style.borderRadius = "4px";

        let statusHtml = isCorrect 
            ? `<span style="color: #4ade80; font-weight: bold;">✅ Correcto</span>` 
            : `<span style="color: #f87171; font-weight: bold;">❌ Incorrecto (Tu respuesta: ${userVal || "Ninguna"})</span>`;
        
        let correctAnswerHtml = !isCorrect 
            ? `<p style="color: #ccc; margin-top: 0.5rem;">La respuesta correcta era: <strong>${q.correct_option}</strong></p>` 
            : "";

        resultItem.innerHTML = `
            <h4 style="color: #fff; margin-bottom: 0.5rem;">${index + 1}. ${q.question_text}</h4>
            ${statusHtml}
            ${correctAnswerHtml}
            <div style="margin-top: 1rem; padding-top: 1rem; border-top: 1px solid #333;">
                <p style="color: #aaa; font-style: italic; font-size: 0.9rem;">💡 <strong>Tip de Aprendizaje:</strong> ${randomTip}</p>
            </div>
        `;
        resultsDiv.appendChild(resultItem);
    });

    document.getElementById("quiz-form").style.display = "none";
    document.getElementById("quiz-results").style.display = "block";
    document.getElementById("final-score").textContent = score;
    document.getElementById("total-qs").textContent = questions.length;
    
    const percentage = (score / questions.length) * 100;
    const msg = document.getElementById("score-message");
    if (percentage === 100) msg.textContent = "¡Excelente! Eres un experto en arquitecturas.";
    else if (percentage >= 80) msg.textContent = "¡Muy bien! Tienes conocimientos sólidos.";
    else if (percentage >= 50) msg.textContent = "Buen intento, pero repasa los temas clave.";
    else msg.textContent = "Te recomendamos leer nuevamente las secciones de aprendizaje.";
    
    window.scrollTo(0, 0);
}

function setupNavigation(currentId, topics) {
    const navButtons = document.getElementById('nav-buttons');
    const btnPrev = document.getElementById('btn-prev');
    const btnNext = document.getElementById('btn-next');
    
    if (!navButtons) return;
    
    const currentIndex = topics.findIndex(t => parseInt(t.id) === currentId);
    
    if (currentIndex !== -1) {
        navButtons.style.display = 'flex';
        
        if (currentIndex > 0) {
            btnPrev.href = `topic.html?id=${topics[currentIndex - 1].id}`;
            btnPrev.style.visibility = 'visible';
        } else {
            btnPrev.style.visibility = 'hidden';
        }
        
        if (currentIndex < topics.length - 1) {
            btnNext.href = `topic.html?id=${topics[currentIndex + 1].id}`;
            btnNext.style.visibility = 'visible';
        } else {
            btnNext.style.visibility = 'hidden';
        }
    }
}

// Helper to execute scripts injected via innerHTML
function executeScripts(container) {
    const scripts = container.querySelectorAll("script");
    scripts.forEach((oldScript) => {
        const newScript = document.createElement("script");
        Array.from(oldScript.attributes).forEach((attr) =>
            newScript.setAttribute(attr.name, attr.value)
        );
        
        // Fix: Strip DOMContentLoaded wrapper if present, as it won't fire again
        let scriptContent = oldScript.innerHTML;
        if (scriptContent.includes('document.addEventListener("DOMContentLoaded"')) {
            scriptContent = scriptContent.replace(/document\.addEventListener\("DOMContentLoaded",\s*function\(\)\s*\{/, "");
            // Remove the last matching }); if possible, or just let it be invalid JS if we are not careful.
            // A safer approach: replace it with an IIFE (Immediately Invoked Function Expression)
            scriptContent = "(function() {" + scriptContent.replace(/document\.addEventListener\("DOMContentLoaded",\s*function\(\)\s*\{/, "");
            // The end is likely }); so we should be fine if we wrapped it in IIFE? 
            // Actually, simply stripping the listener start and the LAST }); might be fragile.
            // Better: Replace `document.addEventListener("DOMContentLoaded", function() {` with `(function() {` 
            // and `});` (at the end) with `})();`.
            
            // Let's try a simpler replacement:
            // Replace the listener start with a simple block
             scriptContent = scriptContent.replace(
                /document\.addEventListener\("DOMContentLoaded",\s*function\(\)\s*\{/g, 
                "(function(){"
            );
            // We assume the closing `});` matches the opening. 
            // If the script ends with `});`, we replace it with `})();`
            // But regex for "last occurrence" is tricky.
            // Let's just execute it. If it was `(function(){ ... });` it is a function definition followed by ;
            // It won't execute. It needs to be called.
            // So `(function(){ ... })();`
            
            // Let's simply replace the start.
            // The original was: `document.addEventListener(..., function() { CODE });`
            // New: `(function() { CODE });` -> This evaluates to a function, but doesn't call it!
            // We need `(function() { CODE })();`
            
            // Hack: Append `();` at the end?
            // If we replace start with `(function(){`, we get `(function(){ ... });`
            // Appending `()` makes it `(function(){ ... });()` -> Valid IIFE.
             scriptContent = scriptContent.replace(/\}\);\s*$/, "})();");
        }
        
        newScript.appendChild(document.createTextNode(scriptContent));
        oldScript.parentNode.replaceChild(newScript, oldScript);
    });
}