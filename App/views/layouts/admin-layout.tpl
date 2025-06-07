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
    {{! $styles }}
    <title>{{ $titulo }}</title>
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
        align-items: center;
        padding: 0 20px;
        height: 60px;
        z-index: 1000;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .navbar-menu {
        display: flex;
        align-items: center;
        height: 100%;
    }

    .navbar-menu ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
        height: 100%;
    }

    .navbar-menu li {
        margin: 0 10px;
    }

    .navbar-menu a {
        display: flex;
        align-items: center;
        padding: 10px 15px;
        color: #FFFFFF;
        text-decoration: none;
        font-family: 'Merriweather', serif;
        font-size: 1rem;
        font-weight: 500;
        border-radius: 5px;
        transition: background 0.3s ease, color 0.3s ease;
        height: 100%;
    }

    .navbar-menu a:hover {
        background: #1D7D74;
        color: #FFFFFF;
    }

    .navbar-menu a i {
        margin-right: 5px;
        font-size: 1.1rem;
    }

    .navbar-title {
        margin: 0;
        font-family: 'Merriweather', serif;
        font-weight: 700;
        color: #FFFFFF;
        flex-grow: 1;
        text-align: center;
    }

    .navbar-profile {
        display: flex;
        align-items: center;
    }

    .navbar-profile img {
        width: 40px;
        height: 40px;
        border: 2px solid #1D7D74;
        border-radius: 50%;
        margin-right: 10px;
        transition: transform 0.3s ease;
    }

    .navbar-profile img:hover {
        transform: scale(1.1);
    }

    .dropdown-menu {
        background: #1D7D74;
        border: none;
        border-radius: 5px;
        padding: 0;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .dropdown-item {
        color: #FFFFFF;
        padding: 10px 20px;
        font-size: 0.9rem;
        transition: background 0.3s ease, color 0.3s ease;
    }

    .dropdown-item:hover {
        background: #26A69A;
        color: #FFFFFF;
    }

    .main-content {
        flex: 1;
        margin-top: 60px;
        padding: 40px 20px;
        min-height: calc(100vh - 60px);
    }

    .main-content.no-navbar {
        margin-top: 0;
        min-height: 100vh;
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

    @media (max-width: 768px) {
        .top-navbar {
            padding: 0 10px;
            flex-direction: column;
            height: auto;
            padding-bottom: 10px;
        }
        .navbar-menu {
            flex-direction: column;
            width: 100%;
        }
        .navbar-menu ul {
            flex-direction: column;
            width: 100%;
        }
        .navbar-menu li {
            margin: 5px 0;
            width: 100%;
        }
        .navbar-menu a {
            justify-content: center;
            width: 100%;
        }
        .navbar-title {
            margin: 10px 0;
            font-size: 1.2rem;
        }
        .navbar-profile img {
            width: 35px;
            height: 35px;
        }
        .main-content {
            padding: 20px 10px;
        }
        .main-content.no-navbar {
            padding: 20px 10px;
        }
    }

    @media (max-width: 576px) {
        .navbar-title {
            font-size: 1rem;
            text-align: left;
        }
        .navbar-profile img {
            width: 30px;
            height: 30px;
        }
        .dropdown-menu {
            right: 0;
            left: auto;
        }
    }
    </style>
</head>
<body>
@csrf
    <div class="top-navbar" id="top-navbar">
        <div class="navbar-menu">
            <ul>
                <li><a href="/leitor/dashboard"><i class="bi bi-house-door"></i> Dashboard</a></li>
                <li><a href="/biblioteca/leitor/alugueis/ativos"><i class="bi bi-cart-check"></i> Aluguéis Ativos</a></li>
                <li><a href="/biblioteca/leitor/historico"><i class="bi bi-clock-history"></i> Histórico</a></li>
                <li><a href="/biblioteca/leitor/meu-cartao"><i class="bi bi-credit-card"></i> Cartão</a></li>
            </ul>
        </div>
        <div class="navbar-title">Painel do Leitor - Bibliogo</div>
        <div class="navbar-profile">
            <img src="{{ $_SESSION['foto'] ? $_SESSION['foto'] : '/assets/imgs/default.jpg' }}" alt="Perfil" class="rounded-circle">
            <div class="dropdown">
                <button class="btn btn-secondary-bibliogo dropdown-toggle" type="button" id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-person-circle"></i>
                </button>
                <ul class="dropdown-menu" aria-labelledby="profileDropdown">
                    <li><a class="dropdown-item" href="/leitor/perfil">Perfil</a></li>
                    <li><a class="dropdown-item" href="/biblioteca/logout">Sair</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div id="loading"><i class="fas fa-spinner"></i></div>

    <main class="main-content" id="main-content">
        {{ $content }}
    </main>

    @js('https://code.jquery.com/jquery-3.6.0.min.js')
    @js('https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js')
    @js('https://cdn.jsdelivr.net/npm/qrcodejs@1.0.0/qrcode.min.js')
    {{! $scripts }}

    <!-- Script Inline para Passar o Tempo de Expiração -->
    <script>
        const isLoggedIn = {{ isset($_SESSION['jwt']) ? 'true' : 'false' }};
    </script>

    <!-- Script para o Contador Regressivo -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const topNavbar = document.getElementById('top-navbar');
            const mainContent = document.getElementById('main-content');
            

            // Ocultar top-navbar  na página de login
            if (window.location.pathname === '/biblioteca/login') {
                if (topNavbar) topNavbar.style.display = 'none';
                if (mainContent) mainContent.classList.add('no-navbar');
                return;
            }

            function logout() {
                if (isLoggingOut) return;
                isLoggingOut = true;

                fetch('/leitor/logout', {
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
                        window.location.href = '/biblioteca/login?loggedOut=true';
                    } else {
                        console.error('Erro ao fazer logout:', data.message);
                        window.location.href = '/biblioteca/login?loggedOut=true';
                    }
                })
                .catch(error => {
                    console.error('Erro ao fazer logout:', error);
                    window.location.href = '/biblioteca/login?loggedOut=true';
                });
            }
        });
    </script>
</body>
</html>