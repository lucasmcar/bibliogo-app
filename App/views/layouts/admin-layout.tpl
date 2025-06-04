<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @css(https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css)
    @css(https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css)
    @css(https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css)
    @css(/assets/css/main-admin.css)
    @css(https://fonts.googleapis.com/icon?family=Material+Icons)
    @css(https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0)
    @css(https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&family=Open+Sans:wght@400;500&display=swap)
    {{ $styles }}
    <title>{{ $title }}</title>
    <style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Open Sans', sans-serif;
        background: #f8f5f0;
        color: #2c2c2c;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        overflow: none;
    }

    .top-navbar {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        background: #26A69A;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 20px;
        height: 60px;
        z-index: 1000;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .sidebar {
        position: fixed;
        top: 60px;
        left: -250px;
        width: 250px;
        height: calc(100% - 60px);
        background: #26A69A;
        padding: 20px;
        box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        z-index: 999;
        transition: left 0.3s ease;
        overflow: auto;
    }

    .top-navbar h4 {
        margin: 0;
        font-family: 'Merriweather', serif;
        font-weight: 700;
        color: #FFFFFF;
    }

    .top-navbar .profile img {
        width: 40px;
        height: 40px;
        border: 2px solid #1D7D74;
        transition: transform 0.3s ease;
    }

    .top-navbar .profile img:hover {
        transform: scale(1.1);
    }

    .sidebar.active {
        left: 0;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .sidebar li {
        margin-bottom: 10px;
        position: relative;
    }

    .sidebar a {
        display: flex;
        align-items: center;
        padding: 12px 15px;
        color: #FFFFFF;
        text-decoration: none;
        font-size: 1rem;
        font-weight: 500;
        border-radius: 5px;
        transition: background 0.3s ease, color 0.3s ease;
    }

    .sidebar a:hover,
    .sidebar a.nav-link:hover {
        background: #1D7D74;
        color: #FFFFFF;
    }

    .sidebar a i {
        margin-right: 10px;
        font-size: 1.2rem;
    }

    .sidebar .dropdown-menu {
        display: none;
        position: absolute;
        left: 0;
        top: 100%;
        background: #1D7D74;
        border: none;
        border-radius: 5px;
        padding: 0;
        width: 100%;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        z-index: 1001;
    }

    .sidebar li:hover > .dropdown-menu {
        display: block;
    }

    .sidebar .dropdown-item {
        color: #FFFFFF;
        padding: 10px 20px;
        font-size: 0.9rem;
        transition: background 0.3s ease, color 0.3s ease;
    }

    .sidebar .dropdown-item:hover {
        background: #26A69A;
        color: #FFFFFF;
    }

    .sidebar .dropdown-toggle::after {
        margin-left: auto;
    }

    .main-content {
        flex: 1;
        margin-top: 60px;
        margin-left: 0;
        padding: 40px 20px;
        min-height: calc(100vh - 60px);
        transition: margin-left 0.3s ease;
    }

    .main-content.shifted {
        margin-left: 250px;
    }

    .main-content.no-navbar {
        margin-top: 0; /* Remove a margem superior quando o navbar não está presente */
        min-height: 100vh; /* Garante que o conteúdo ocupe toda a altura da tela */
    }

    #toggle-sidebar {
        background: none;
        border: none;
        color: #FFFFFF;
        font-size: 1.5rem;
        margin-right: 20px;
        cursor: pointer;
    }

    #loading {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 1200;
        color: #26A69A;
    }

    #loading .fa-spinner {
        font-size: 2.5rem;
        animation: spin 1s linear infinite;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    /* Estilo do Contador Regressivo */
    .session-timer {
        position: fixed;
        top: 70px;
        right: 20px;
        background: #26A69A;
        color: #FFFFFF;
        padding: 8px 15px;
        border-radius: 5px;
        font-size: 0.9rem;
        font-weight: 500;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        z-index: 998;
    }

    /* Estilo do Modal */
    .modal-content {
        background: #FFFFFF;
        color: #2c2c2c;
        border: none;
        border-radius: 8px;
    }

    .modal-header {
        border-bottom: 1px solid #ddd;
    }

    .modal-title {
        font-family: 'Merriweather', serif;
        font-weight: 700;
        color: #2c2c2c;
    }

    .modal-body {
        font-size: 1rem;
        color: #555;
    }

    .modal-footer {
        border-top: 1px solid #ddd;
    }

    .btn-bibliogo {
        background: #26A69A;
        color: #FFFFFF;
        border: none;
        padding: 8px 20px;
        font-weight: 600;
        border-radius: 5px;
        transition: background 0.3s ease;
    }

    .btn-bibliogo:hover {
        background: #1D7D74;
    }

    .btn-secondary-bibliogo {
        background: #FFFFFF;
        color: #2c2c2c;
        border: 1px solid #ddd;
        padding: 8px 20px;
        font-weight: 600;
        border-radius: 5px;
        transition: background 0.3s ease;
    }

    .btn-secondary-bibliogo:hover {
        background: #f8f5f0;
    }

    /* Responsividade */
    @media (max-width: 768px) {
        .sidebar {
            width: 200px;
            left: -200px;
        }
        .sidebar.active {
            left: 0;
        }
        .main-content.shifted {
            margin-left: 200px;
        }
        .main-content {
            padding: 20px 10px;
        }
        .main-content.no-navbar {
            padding: 20px 10px;
        }
        .sidebar .dropdown-menu {
            position: static;
            width: 100%;
            box-shadow: none;
        }
        .session-timer {
            top: 60px;
            right: 10px;
            font-size: 0.8rem;
            padding: 5px 10px;
        }
    }

    /* Scrollbar do menu */
    .sidebar::-webkit-scrollbar {
        width: 6px;
    }

    .sidebar::-webkit-scrollbar-track {
        background: #f8f5f0;
    }

    .sidebar::-webkit-scrollbar-thumb {
        background: #26A69A;
        border-radius: 6px;
    }

    .sidebar::-webkit-scrollbar-thumb:hover {
        background: #1D7D74;
    }
    </style>
</head>
<body>
@csrf
    <div class="top-navbar" id="top-navbar">
        <div style="display: flex; align-items: center;">
            <button id="toggle-sidebar"><i class="bi bi-list"></i></button>
            <h4 class="text-white p-3">Painel Administrativo - Bibliogo</h4>
        </div>
        <div class="profile">
            <img src="{{ $_SESSION['foto'] ? $_SESSION['foto'] : '/assets/imgs/default.jpg' }}" alt="Perfil" class="rounded-circle">
        </div>
    </div>

    <div class="sidebar" id="sidebar">
        <div style="text-align: center; padding: 20px 0;">
            <img src="/assets/imgs/bibliogo-logo.png" alt="Bibliogo" style="max-width: 150px;">
        </div>
        <ul>
            <li><a href="/admin/home" class="nav-link" data-page="home"><i class="bi bi-house-door"></i><span>Dashboard</span></a></li>
            
            <!-- Gerenciamento de Usuários -->
            <li>
                <a href="#" class="nav-link accordion-toggle">
                    <i class="bi bi-people"></i><span>Usuários</span>
                    <i class="bi bi-chevron-down accordion-icon"></i>
                </a>
                <ul class="accordion-menu">
                    <li><a href="#" class="nav-link" data-page="usuarios/cadastro"><i class="bi bi-person-plus-fill"></i>Cadastro</a></li>
                    <li><a href="#" class="nav-link" data-page="usuarios/lista"><i class="bi bi-list"></i>Lista de Usuários</a></li>
                </ul>
            </li>

            <!-- Gerenciamento de Bibliotecas -->
            <li>
                <a href="#" class="nav-link accordion-toggle">
                    <i class="bi bi-book"></i><span>Bibliotecas</span>
                    <i class="bi bi-chevron-down accordion-icon"></i>
                </a>
                <ul class="accordion-menu">
                    <li><a href="#" class="nav-link" data-page="bibliotecas/lista"><i class="bi bi-list"></i>Lista de Bibliotecas</a></li>
                    <li><a href="#" class="nav-link" data-page="bibliotecas/estatisticas"><i class="bi bi-bar-chart"></i>Estatísticas</a></li>
                </ul>
            </li>

            <!-- Gerenciamento de Livros -->
            <li>
                <a href="#" class="nav-link accordion-toggle">
                    <i class="bi bi-bookshelf"></i><span>Livros</span>
                    <i class="bi bi-chevron-down accordion-icon"></i>
                </a>
                <ul class="accordion-menu">
                    <li><a href="#" class="nav-link" data-page="livros/cadastro"><i class="bi bi-bookmark-plus"></i>Cadastro</a></li>
                    <li><a href="#" class="nav-link" data-page="livros/lista"><i class="bi bi-list"></i>Lista de Livros</a></li>
                </ul>
            </li>

            <!-- Gerenciamento de Aluguéis -->
            <li>
                <a href="#" class="nav-link accordion-toggle">
                    <i class="bi bi-cart-check"></i><span>Aluguéis</span>
                    <i class="bi bi-chevron-down accordion-icon"></i>
                </a>
                <ul class="accordion-menu">
                    <li><a href="#" class="nav-link" data-page="alugueis/lista"><i class="bi bi-list"></i>Lista de Aluguéis</a></li>
                    <li><a href="#" class="nav-link" data-page="alugueis/pendentes"><i class="bi bi-clock"></i>Pendentes</a></li>
                </ul>
            </li>

            <!-- Relatórios -->
            <li>
                <a href="#" class="nav-link accordion-toggle">
                    <i class="bi bi-file-earmark-bar-graph"></i><span>Relatórios</span>
                    <i class="bi bi-chevron-down accordion-icon"></i>
                </a>
                <ul class="accordion-menu">
                    <li><a href="#" class="nav-link" data-page="relatorios/geral"><i class="bi bi-bar-chart"></i>Relatório Geral</a></li>
                    <li><a href="#" class="nav-link" data-page="relatorios/usuarios"><i class="bi bi-people"></i>Usuários</a></li>
                    <li><a href="#" class="nav-link" data-page="relatorios/alugueis"><i class="bi bi-cart-check"></i>Aluguéis</a></li>
                </ul>
            </li>

            <!-- Configurações -->
            <li>
                <a href="#" class="nav-link accordion-toggle">
                    <i class="bi bi-gear"></i><span>Configurações</span>
                    <i class="bi bi-chevron-down accordion-icon"></i>
                </a>
                <ul class="accordion-menu">
                    <li><a href="#" class="nav-link" data-page="perfil"><i class="bi bi-person"></i>Perfil</a></li>
                    <li><a href="#" class="nav-link" data-page="configuracoes/site"><i class="bi bi-globe"></i>Site</a></li>
                    <li><a href="#" class="nav-link" data-page="configuracoes/logs"><i class="bi bi-card-list"></i>Logs</a></li>
                </ul>
            </li>

            <li><a href="/admin/logout" class="nav-link"><i class="bi bi-box-arrow-right"></i><span>Sair</span></a></li>
        </ul>
    </div>

    <div id="loading"><i class="fas fa-spinner"></i></div>

    <!-- Contador Regressivo -->
    <div class="session-timer" id="session-timer">
        Sessão expira em: <span id="timer">00:00:00</span>
    </div>

    <!-- Modal de Aviso -->
    <div class="modal fade" id="session-expiry-modal" tabindex="-1" aria-labelledby="sessionExpiryModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="sessionExpiryModalLabel">Sessão Expirando</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Sua sessão está prestes a expirar em <span id="modal-timer">5:00</span>. Você será deslogado automaticamente quando o tempo acabar.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary-bibliogo" data-bs-dismiss="modal">Continuar</button>
                    <button type="button" class="btn btn-bibliogo" onclick="window.location.href='/admin/logout'">Sair Agora</button>
                </div>
            </div>
        </div>
    </div>

    <main class="main-content" id="main-content">
        {{ $content }}
    </main>

    @js('https://code.jquery.com/jquery-3.6.0.min.js')
    @js('https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js')
    {{ $scripts }}

    <!-- Script Inline para Passar o Tempo de Expiração -->
    <script>
        const tokenExpiry = {{ isset($_SESSION['jwt_exp']) ? $_SESSION['jwt_exp'] : 0 }};
        const isLoggedIn = {{ isset($_SESSION['jwt']) ? 'true' : 'false' }};
    </script>

    <!-- Script para o Contador Regressivo e Ajuste do Navbar -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const topNavbar = document.getElementById('top-navbar');
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('main-content');
            const sessionTimer = document.getElementById('session-timer');

            // Ocultar top-navbar, sidebar e session-timer na página de login
            if (window.location.pathname === '/biblioteca/login') {
                if (topNavbar) {
                    topNavbar.style.display = 'none';
                }
                if (sidebar) {
                    sidebar.style.display = 'none';
                }
                if (sessionTimer) {
                    sessionTimer.style.display = 'none';
                }
                if (mainContent) {
                    mainContent.classList.add('no-navbar');
                }
                return;
            }

            if (!isLoggedIn || tokenExpiry === 0) {
                if (sessionTimer) {
                    sessionTimer.style.display = 'none';
                }
                return;
            }

            const timerElement = document.getElementById('timer');
            const modalTimerElement = document.getElementById('modal-timer');
            const sessionExpiryModal = new bootstrap.Modal(document.getElementById('session-expiry-modal'), {
                backdrop: 'static',
                keyboard: false
            });

            const now = Math.floor(Date.now() / 1000);
            let timeLeft = tokenExpiry - now;
            let isLoggingOut = false;

            if (timeLeft <= 0) {
                sessionTimer.style.display = 'none';
                return;
            }

            function formatTime(seconds) {
                const hours = Math.floor(seconds / 3600);
                const minutes = Math.floor((seconds % 3600) / 60);
                const secs = seconds % 60;
                return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
            }

            function logout() {
                if (isLoggingOut) {
                    return;
                }
                isLoggingOut = true;

                fetch('/admin/logout', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector('input[name="_csrf_token"]')?.value
                    }
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        localStorage.removeItem('jwt');
                        sessionStorage.removeItem('jwt');
                        window.location.href = '/admin/login?loggedOut=true';
                    } else {
                        console.error('Erro ao fazer logout:', data.message);
                        window.location.href = '/admin/login?loggedOut=true';
                    }
                })
                .catch(error => {
                    console.error('Erro ao fazer logout:', error);
                    window.location.href = '/admin/login?loggedOut=true';
                });
            }

            const timerInterval = setInterval(function () {
                timeLeft--;
                timerElement.textContent = formatTime(timeLeft);

                if (timeLeft === 300) {
                    sessionExpiryModal.show();
                    let modalTimeLeft = 300;
                    const modalTimerInterval = setInterval(function () {
                        modalTimeLeft--;
                        modalTimerElement.textContent = formatTime(modalTimeLeft);
                        if (modalTimeLeft <= 0) {
                            clearInterval(modalTimerInterval);
                        }
                    }, 1000);
                }

                if (timeLeft <= 0) {
                    clearInterval(timerInterval);
                    window.location.href = '/admin/login';
                }
            }, 1000);

            timerElement.textContent = formatTime(timeLeft);
        });
    </script>
</body>
</html>