
    <!-- Hero Banner -->
        <header class="hero">
            <div class="hero-content">
                <h1>Descubra, Alugue, Compartilhe</h1>
                <p>Crie sua biblioteca pessoal com a Bibliogo e conecte-se com leitores pelo Brasil!</p>
                <a href="/cadastro" class="btn btn-bibliogo">Comece Agora</a>
            </div>
        </header>

        <!-- Seção Livros em Destaque -->
        <section class="hda-section">
            <div class="container">
                <h2 class="hda-title text-center">Livros em Destaque</h2>
                <div class="row">
                    {% foreach $livros as $index => $livro %}
                    <div class="col-md-4 mb-4">
                        <div class="card book-card">
                            <img src="{{ $livro['capa'] }}" class="card-img-top" alt="Livro 1">
                            <div class="card-body">
                                <h5 class="card-title">{{ $livro['titulo'] }}</h5>
                                <p class="card-text">{{ $livro['curto']}}. Alugue por R${{ $livro['preco']}}.</p>
                                <a href="/livro/{{ $livro['slug'] }}" class="btn btn-bibliogo">Ver Detalhes</a>
                            </div>
                        </div>
                    </div>
                    {% endforeach; %}
                    
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="/bibliotecas" class="btn btn-bibliogo">Explorar Mais Livros</a>
        </div>
    </div>
</section>

<!-- Seção CTA -->
<section class="cta-section">
    <div class="container">
        <h2>Junte-se à Bibliogo</h2>
            <p>Crie sua biblioteca, compartilhe seus livros e conecte-se com leitores pelo Instagram!</p>
            <a href="/cadastro" class="btn btn-bibliogo">Cadastrar Agora</a>
    </div>
</section>