<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="/assets/imgs/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content="consultoria, editais culturais, produção executiva, captação de recursos, projetos artísticos, produtora cultural, financiamento, gestão, hd arte, gestao">
    <!-- Compiled and minified CSS -->
    @css(https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css)
    @css(https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css)
    @css(https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css)
    @css(/assets/css/main.css)
    @css(https://fonts.googleapis.com/icon?family=Material+Icons)
    <link rel="stylesheet"  href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"/>
    {{! $styles }}

    <title>{{ $titulo }}</title>
    <style>
    </style>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
        <div class="container">
            <a class="navbar-brand fw-bold" href="/"><img src="/assets/imgs/bibliogo.png" alt="Logo da Bibliogo" style="height: 80px; width: 80px;"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link nav-link-custom" href="/sobre">Sobre</a></li>
                    <li class="nav-item"><a class="nav-link nav-link-custom" href="/como-funciona">Como Funciona</a></li>
                    <li class="nav-item"><a class="nav-link nav-link-custom" href="/bibliotecas">Bibliotecas</a></li>
                    <li class="nav-item"><a class="nav-link nav-link-custom" href="/cadastro">Cadastrar</a></li>
                    <li class="nav-item"><a class="nav-link nav-link-custom" href="/contato">Contato</a></li>
                </ul>
                <div class="divider"></div>
                <div class="search-container">
                    <form class="search-form" action="/search" method="GET">
                        <input type="text" class="search-input" name="q" placeholder="Pesquisar livros..." id="searchInput">
                        <i class="bi bi-search search-icon"></i>
                    </form>
                    <div class="search-results" id="searchResults"></div>
                </div>
                <div class="social-icons">
                    <a href="https://www.instagram.com/bibliogo" target="_blank" class="social-link"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.facebook.com/bibliogo" target="_blank" class="social-link"><i class="fab fa-facebook-f"></i></a>
                </div>
            </div>
            
        </div>
    </nav>


    <!-- Main Content -->
    <main class="main-content">
        {{ $content }}
    </main>

    <!-- Footer -->
    <footer class="footer mt-3 py-3" style="background-color: #26A69A; color: #FFFFFF;">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5>Menu</h5>
                    <ul class="list-unstyled">
                        <li><a href="/" class="footer-link">Home</a></li>
                        <li><a href="/sobre" class="footer-link">Sobre</a></li>
                        <li><a href="/como-funciona" class="footer-link">Como Funciona</a></li>
                        <li><a href="/bibliotecas" class="footer-link">Bibliotecas</a></li>
                        <li><a href="/cadastro" class="footer-link">Cadastrar</a></li>
                        <li><a href="/contato" class="footer-link">Contato</a></li>
                    </ul>
                </div>
                <div class="col-md-4 text-center mb-3">
                    <h5>Redes Sociais</h5>
                    <a href="https://instagram.com/bibliogo" class="social-link me-3"><i class="fab fa-instagram fa-2x"></i></a>
                    <a href="https://facebook.com/bibliogo" class="social-link"><i class="fab fa-facebook-f fa-2x"></i></a>
                </div>
                <div class="col-md-4 text-center">
                    <h5>© 2025 Bibliogo</h5>
                    <p>Todos os direitos reservados.</p>
                </div>
            </div>
        </div>
    </footer>
    <div vw class="enabled">
        <div vw-access-button class="active"></div>
            <div vw-plugin-wrapper>
        <div class="vw-plugin-top-wrapper"></div>
    </div>
  </div>
    
    <!-- Bootstrap JS -->
    @js('https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js')
    @js('/assets/js/main.min.js')
    @js('/assets/js/fetch.min.js')
    @js('https://vlibras.gov.br/app/vlibras-plugin.js')
    <script>
        new window.VLibras.Widget('https://vlibras.gov.br/app');
    </script>

    {{! $scripts }}
<script src="https://vlibras.gov.br/app/vlibras-plugin.js"></script>
    <script>
        new window.VLibras.Widget('https://vlibras.gov.br/app');
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const searchInput = document.getElementById('searchInput');
            const searchResults = document.getElementById('searchResults');
            const searchContainer = document.querySelector('.search-container');

            async function fetchResults(query) {
                try {
                    const response = await fetch(`/search?q=${encodeURIComponent(query)}`, {
                        method: 'GET',
                        headers: {
                            'Accept': 'application/json'
                        }
                    });
                    if (!response.ok) throw new Error('Erro na busca');
                    const data = await response.json();
                    displayResults(data);
                } catch (error) {
                    console.error('Erro ao buscar resultados:', error);
                    searchResults.innerHTML = '<a href="#">Erro ao carregar resultados</a>';
                }
            }

            function displayResults(results) {
                searchResults.innerHTML = '';
                if (results.length === 0) {
                    searchResults.style.display = 'none';
                    return;
                }

                results.forEach(result => {
                    const link = document.createElement('a');
                    link.href = result.url;
                    link.textContent = result.title;
                    searchResults.appendChild(link);
                });
                searchResults.style.display = 'block';
            }

            let timeout;
            searchInput.addEventListener('input', function () {
                clearTimeout(timeout);
                const query = this.value.trim();
                if (query.length < 2) {
                    searchResults.style.display = 'none';
                    return;
                }

                timeout = setTimeout(() => fetchResults(query), 300);
            });

            document.addEventListener('click', function (e) {
                if (!searchContainer.contains(e.target)) {
                    searchResults.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>