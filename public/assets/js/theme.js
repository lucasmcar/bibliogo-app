document.addEventListener('DOMContentLoaded', function () {
    const themeToggle = document.getElementById('theme-toggle');
    const body = document.body;

    // Verifica a preferência do sistema
    if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
        body.setAttribute('data-theme', 'dark');
        themeToggle.innerHTML = '<i class="bi bi-sun-fill"></i><span class="visually-hidden">Alternar para Claro</span>';
    } else {
        body.setAttribute('data-theme', 'light');
        themeToggle.innerHTML = '<i class="bi bi-moon-fill"></i><span class="visually-hidden">Alternar para Escuro</span>';
    }

    // Alterna o tema ao clicar
    themeToggle.addEventListener('click', function () {
        if (body.getAttribute('data-theme') === 'light') {
            body.setAttribute('data-theme', 'dark');
            themeToggle.innerHTML = '<i class="bi bi-sun-fill"></i><span class="visually-hidden">Alternar para Claro</span>';
            localStorage.setItem('theme', 'dark');
        } else {
            body.setAttribute('data-theme', 'light');
            themeToggle.innerHTML = '<i class="bi bi-moon-fill"></i><span class="visually-hidden">Alternar para Escuro</span>';
            localStorage.setItem('theme', 'light');
        }
    });

    // Carrega o tema salvo, se existir
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme) {
        body.setAttribute('data-theme', savedTheme);
        themeToggle.innerHTML = savedTheme === 'dark' 
            ? '<i class="bi bi-sun-fill"></i><span class="visually-hidden">Alternar para Claro</span>'
            : '<i class="bi bi-moon-fill"></i><span class="visually-hidden">Alternar para Escuro</span>';
    }
});