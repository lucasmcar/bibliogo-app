<!-- Dashboard do Leitor -->
<section class="container dashboard-section">
    <h2 class="dashboard-title">{{ $titulo }}</h2>
    <p class="dashboard-text">{{ $subtitulo }}</p>

    <!-- Seção de Busca -->
    <div class="search-container">
        <div class="search-bar">
            <input type="text" id="search-input" class="form-control" placeholder="Busque por livros ou bibliotecas...">
            <button id="search-button" class="btn btn-bibliogo"><i class="fas fa-search"></i></button>
        </div>
        <div id="search-results" class="search-results"></div>
    </div>

    <div class="dashboard-grid">
        <div class="dashboard-card">
            <h3>Aluguéis Ativos</h3>
            <div class="metric">2</div>
            <span>Veja os livros que você está alugando agora.</span>
            <a href="/biblioteca/leitor/alugueis/ativos" class="btn btn-bibliogo mt-3">Ver Detalhes</a>
        </div>
        <div class="dashboard-card">
            <h3>Histórico de Aluguéis</h3>
            <div class="metric">5</div>
            <span>Confira os livros que você já alugou.</span>
            <a href="/biblioteca/leitor/alugueis/historico" class="btn btn-bibliogo mt-3">Ver Histórico</a>
        </div>
        <div class="dashboard-card">
            <h3>Cartão Virtual</h3>
            <div class="metric">Ver Cartão</div>
            <span>Apresente este cartão para alugar livros.</span>
            <a href="/biblioteca/meu-cartao" class="btn btn-bibliogo mt-3">Acessar Cartão</a>
        </div>
    </div>
</section>