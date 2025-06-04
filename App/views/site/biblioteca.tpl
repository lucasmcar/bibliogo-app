<!-- Página Bibliotecas -->
<section class="container hda-section">
    <!-- Introdução -->
    <h2 class="hda-title">{{ $titulo }}</h2>
    <p class="hda-text">Conheça as bibliotecas mais bem avaliadas da nossa comunidade!</p>

    <!-- Filtros -->
    <div class="filter-section mb-4">
        <div class="row">
            <div class="col-md-6">
                <label for="location-filter" class="filter-label">Filtrar por Localização</label>
                <input type="text" id="location-filter" class="form-control filter-input" placeholder="Digite uma cidade ou região">
            </div>
            <div class="col-md-6">
                <label for="books-filter" class="filter-label">Filtrar por Nº de Livros</label>
                <select id="books-filter" class="form-control filter-input">
                    <option value="">Todos</option>
                    <option value="1-10">1-10 livros</option>
                    <option value="11-50">11-50 livros</option>
                    <option value="51+">Mais de 50 livros</option>
                </select>
            </div>
        </div>
    </div>

    <!-- Bibliotecas em Destaque -->
    <div class="row" id="libraries-container">
        {% foreach $bibliotec as $index => $biblioteca %}
            <div class="col-md-4 col-sm-6 col-12 mb-4 library-card" data-location="{{ $biblioteca['localizacao'] }}" data-books="{{ $biblioteca['numero_livros'] }}">
                <div class="library-card-content">
                    <h3 class="hda-subtitle">{{ $biblioteca['nome'] }}</h3>
                    <p class="library-text">Criador: {{ $biblioteca['criador'] }}</p>
                    <p class="library-text">Localização: {{ $biblioteca['localizacao'] }}</p>
                    <p class="library-text">Livros Disponíveis: {{ $biblioteca['numero_livros'] }}</p>
                    <p class="library-text">Avaliação: {{ $biblioteca['nota'] }}/5 <i class="bi bi-star-fill" style="color: #FFD700;"></i></p>
                    <a href="/biblioteca/{{ $biblioteca['id'] }}" class="btn btn-bibliogo mt-2">Explorar Biblioteca</a>
                </div>
            </div>
        {% endforeach; %}
    </div>
</section>