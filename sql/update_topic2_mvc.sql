USE mobile_architectures;

-- 1. Limpiar subtemas existentes del Tema 2 para evitar conflictos
DELETE FROM subtemas WHERE tema_id = 2;

-- 2. Insertar nuevo contenido para el Tema 2

-- 2.1 Definición de MVC
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.1 Definición de MVC', 
    '
    <div class="definition-box" style="background: rgba(0,0,255,0.05); padding: 1.5rem; border-left: 5px solid var(--accent-blue); margin-bottom: 2rem; border-radius: 4px;">
        <h4 style="color: var(--accent-blue); margin-bottom: 0.5rem;">Concepto Clave</h4>
        <p><strong>MVC (Model-View-Controller)</strong> se define como una arquitectura o patrón de diseño que divide la aplicación en tres componentes principales interconectados: <strong>Modelo (Model)</strong>, <strong>Vista (View)</strong> y <strong>Controlador (Controller)</strong>, con el objetivo principal de separar la lógica de negocio y los datos de la interfaz de usuario.</p>
    </div>

    <p>Este patrón, originado en los años 70 para interfaces gráficas, es ampliamente utilizado en desarrollo móvil (como en Android con Activities como Controllers, o iOS con UIViewControllers), ya que facilita la <strong>separación de preocupaciones (separation of concerns)</strong>, permitiendo que cambios en la UI no afecten la lógica de datos y viceversa.</p>

    <p>En apps móviles, MVC organiza el código en capas, donde el flujo típico es: el usuario interactúa con la View, que notifica al Controller; este actualiza el Model y refresca la View, asegurando eficiencia en entornos con recursos limitados como batería o memoria. Aunque no es estrictamente implementado en frameworks móviles modernos (que prefieren MVVM o MVP para mejor testabilidad), MVC sirve como base para apps simples, reduciendo complejidad y facilitando colaboración en equipos.</p>

    <div class="highlight-box" style="border: 1px dashed var(--accent-purple); padding: 1rem; border-radius: 8px; margin-top: 1rem; background: rgba(128, 0, 128, 0.05);">
        <strong>Resumen:</strong> MVC es un patrón clásico que transforma el desarrollo de apps complejas en un proceso manejable, alineado con principios de modularidad y reutilización.
    </div>

    <div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
        <img src="images/MVC3.webp" alt="Diagrama Ilustrativo de MVC" style="max-width: 100%; border-radius: 8px; border: 1px solid #333; box-shadow: 0 0 20px rgba(0,0,255,0.2);">
        <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama Ilustrativo de MVC</p>
    </div>
    '
);

-- 2.2 Componentes de MVC
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.2 Componentes de MVC', 
    '
    <p>Los componentes de MVC se dividen en tres roles interconectados, cada uno con responsabilidades específicas para mantener la separación de preocupaciones en aplicaciones móviles.</p>

    <div class="objectives-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-top: 2rem;">

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #00c6ff;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">📦 Modelo (Model)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Gestiona los datos y la lógica de negocio, representando entidades del mundo real (usuarios, productos). Es responsable de almacenar, recuperar y manipular datos, aplicar reglas de negocio y validar integridad sin conocimiento de la UI.</p>
            <p style="font-size: 0.8rem; color: #888; margin-top: 0.5rem;"><em>Ejemplo: En e-commerce, maneja inventario y precios.</em></p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #9d50bb;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">👁️ Vista (View)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Se encarga de la interfaz de usuario, presentando datos visualmente y manejando interacciones (botones, listas). Es pasiva y se enfoca en renderización, no lógica.</p>
            <p style="font-size: 0.8rem; color: #888; margin-top: 0.5rem;"><em>Ejemplo: XML layouts en Android, Storyboards en iOS.</em></p>
        </div>

        <div class="objective-card" style="background: #1a1a1a; padding: 1.5rem; border-radius: 8px; border-top: 3px solid #6e48aa;">
            <h4 style="color: #fff; margin-bottom: 0.5rem;">🎮 Controlador (Controller)</h4>
            <p style="font-size: 0.9rem; color: #ccc;">Intermediario entre Model y View. Procesa entradas del usuario, actualiza el Model y refresca la View. Contiene la lógica principal de la aplicación.</p>
            <p style="font-size: 0.8rem; color: #888; margin-top: 0.5rem;"><em>Ejemplo: Activities en Android, UIViewController en iOS.</em></p>
        </div>

    </div>

    <p style="margin-top: 2rem; color: #aaa; font-style: italic;">Estos componentes interactúan unidireccionalmente: View → Controller → Model → Controller → View, asegurando un flujo eficiente.</p>
    '
);

-- 2.3 Flujo de Comunicación en MVC
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.3 Flujo de Comunicación en MVC', 
    '
    <p>Este subtema describe cómo fluye la información entre el Modelo, la Vista y el Controlador en MVC. El flujo es unidireccional y cíclico, basado en el principio de separación de preocupaciones.</p>

    <div class="flow-steps" style="background: rgba(255,255,255,0.02); padding: 1.5rem; border-radius: 8px; margin-top: 1.5rem;">
        <ol style="margin-left: 1.5rem; color: #e0e0e0;">
            <li style="margin-bottom: 1rem;">
                <strong>Acción del usuario en la Vista:</strong> El usuario interactúa con la interfaz (presiona un botón), generando un evento que se envía al Controlador.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Procesamiento en el Controlador:</strong> Recibe la entrada, valida, aplica lógica y decide si actualizar el Modelo.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Actualización del Modelo:</strong> Procesa cambios (interactuando con DB o API), actualiza sus datos y notifica al Controlador.
            </li>
            <li style="margin-bottom: 1rem;">
                <strong>Refresco de la Vista:</strong> El Controlador recibe la notificación, obtiene datos actualizados y los envía a la Vista para mostrar los cambios.
            </li>
        </ol>
    </div>

    <div class="diagram-placeholder" style="margin: 2rem 0; text-align: center;">
        <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=mvc%20architecture%20communication%20flow%20diagram%20user%20action%20controller%20model%20view%20cycle%20neon%20tech&image_size=landscape_16_9" alt="Diagrama de Flujo MVC" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
        <p style="font-size: 0.9rem; color: #888; margin-top: 0.5rem;">Diagrama del Flujo de Comunicación en MVC</p>
    </div>
    '
);

-- 2.4 Aplicación de MVC en Entornos Móviles
INSERT INTO subtemas (tema_id, titulo, contenido) VALUES (
    2, 
    '2.4 Aplicación de MVC en Entornos Móviles', 
    '
    <p>Se analiza cómo se implementa MVC en aplicaciones móviles y las particularidades que presenta en plataformas como Android e iOS, donde algunos componentes pueden combinar responsabilidades para optimizar rendimiento.</p>

    <div class="platform-comparison" style="display: flex; flex-direction: column; gap: 2rem; margin-top: 2rem;">
        
        <div class="android-section" style="border-left: 4px solid #3ddc84; padding-left: 1.5rem;">
            <h3 style="color: #3ddc84;">🤖 Implementación en Android</h3>
            <p>MVC se implementa con <strong>Activities o Fragments</strong> como Controladores, <strong>XML layouts</strong> como Vistas, y clases POJO como Modelos.</p>
            <p><strong>Particularidad:</strong> Los Controladores combinan responsabilidades de UI y lógica para eficiencia, pero pueden volverse clases infladas ("God Objects").</p>
            <div class="diagram-placeholder" style="margin: 1rem 0;">
                <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=android%20mvc%20architecture%20diagram%20activity%20xml%20model%20flow%20green%20tech%20style&image_size=landscape_16_9" alt="MVC en Android" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
            </div>
        </div>

        <div class="ios-section" style="border-left: 4px solid #007aff; padding-left: 1.5rem;">
            <h3 style="color: #007aff;">🍎 Implementación en iOS</h3>
            <p>MVC es el patrón nativo. <strong>UIViewController</strong> combina roles de Vista y Controlador, mientras que Modelos son clases separadas.</p>
            <p><strong>Particularidad:</strong> Optimizado para interfaces táctiles y ciclos de vida, pero propenso a "Massive View Controllers".</p>
            <div class="diagram-placeholder" style="margin: 1rem 0;">
                <img src="https://coreva-normal.trae.ai/api/ide/v1/text_to_image?prompt=ios%20mvc%20architecture%20diagram%20viewcontroller%20storyboard%20model%20blue%20tech%20style&image_size=landscape_16_9" alt="MVC en iOS" style="max-width: 100%; border-radius: 8px; border: 1px solid #333;">
            </div>
        </div>

    </div>

    <div class="highlight-box" style="margin-top: 2rem; padding: 1rem; background: rgba(255,255,255,0.05); border-radius: 8px;">
        <h4 style="color: var(--text-main);">Conclusión</h4>
        <p>En ambas plataformas, MVC facilita el desarrollo inicial pero suele evolucionar a MVVM o Clean Architecture en aplicaciones complejas para mejorar la testabilidad y el mantenimiento.</p>
    </div>
    '
);
