<?php include 'includes/header.php'; ?>

<div class="card about-section">
    <h1 class="glow-text">Acerca de Nosotros</h1>
    <p style="font-size: 1.1rem; color: #ccc; margin-top: 1rem;">
        Somos un equipo apasionado por el desarrollo de software y las arquitecturas móviles. 
        Nuestro objetivo es compartir conocimiento sobre las mejores prácticas y patrones de diseño en el ecosistema móvil.
    </p>
</div>

<div class="card social-media-section">
    <h2 style="color: var(--accent-purple); margin-bottom: 2rem;">Conéctate con Nosotros</h2>
    
    <div class="social-links-grid">
        <!-- WhatsApp -->
        <a href="https://w.app/w1oirc" target="_blank" class="social-card whatsapp">
            <div class="icon">
                <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg" alt="WhatsApp Logo">
            </div>
            <h3>WhatsApp</h3>
            <p>Contáctanos directamente</p>
        </a>

        <!-- Gmail -->
        <a href="https://mail.google.com/mail/u/0/?fs=1&to=cmcarlosxcmsa@gmail.com&tf=cm" target="_blank" class="social-card gmail">
            <div class="icon">
                <img src="https://upload.wikimedia.org/wikipedia/commons/7/7e/Gmail_icon_%282020%29.svg" alt="Gmail Logo">
            </div>
            <h3>Gmail</h3>
            <p>Envíanos un correo</p>
        </a>

        <!-- Discord -->
        <a href="https://discord.gg/bt4gQ7sBM" target="_blank" class="social-card discord">
            <div class="icon">
                <img src="images/discord.jpg" alt="Discord Logo">
            </div>
            <h3>Discord</h3>
            <p>Únete a nuestra comunidad</p>
        </a>
    </div>
</div>

<style>
    .social-links-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 2rem;
        margin-top: 2rem;
    }

    .social-card {
        background: rgba(255, 255, 255, 0.05);
        padding: 2rem;
        border-radius: 12px;
        text-align: center;
        text-decoration: none;
        color: var(--text-main);
        transition: transform 0.3s ease, background 0.3s ease;
        border: 1px solid transparent;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .social-card:hover {
        transform: translateY(-10px);
        background: rgba(255, 255, 255, 0.1);
    }

    .social-card .icon {
        width: 60px;
        height: 60px;
        margin-bottom: 1rem;
    }

    .social-card .icon img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }

    .social-card h3 {
        margin-bottom: 0.5rem;
        font-size: 1.5rem;
    }

    .social-card p {
        color: var(--text-secondary);
        font-size: 0.9rem;
    }

    /* Specific Colors on Hover */
    .social-card.whatsapp:hover {
        border-color: #25D366;
        box-shadow: 0 0 20px rgba(37, 211, 102, 0.2);
    }

    .social-card.gmail:hover {
        border-color: #EA4335;
        box-shadow: 0 0 20px rgba(234, 67, 53, 0.2);
    }

    .social-card.discord:hover {
        border-color: #5865F2;
        box-shadow: 0 0 20px rgba(88, 101, 242, 0.2);
    }
</style>

<?php include 'includes/footer.php'; ?>
