document.addEventListener('DOMContentLoaded', () => {
    // Highlight active link based on URL parameters
    const urlParams = new URLSearchParams(window.location.search);
    const currentTopicId = urlParams.get('id');

    if (currentTopicId) {
        const activeLink = document.querySelector(`.topic-list a[href="topic.php?id=${currentTopicId}"]`);
        if (activeLink) {
            activeLink.classList.add('active');
        }
    } else {
        // If no ID, assume home or first item
        const homeLink = document.querySelector('.topic-list a[href="index.php"]');
        if (homeLink && window.location.pathname.endsWith('index.php')) {
            homeLink.classList.add('active');
        }
    }

    // Add simple fade-in effect for cards
    const cards = document.querySelectorAll('.card, .subtopic');
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = 1;
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, { threshold: 0.1 });

    cards.forEach(card => {
        card.style.opacity = 0;
        card.style.transform = 'translateY(20px)';
        card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(card);
    });
});
