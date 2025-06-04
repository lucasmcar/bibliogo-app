<!-- Página Como Funciona -->
<section class="container hda-section">
    <!-- Introdução -->
    <h2 class="hda-title">{{ $title }}</h2>
    <p class="hda-text">Descubra como o Bibliogo facilita o compartilhamento e aluguel de livros de forma simples e acessível.</p>

    <!-- Como Funciona -->
    <div class="row mt-4">
        {% foreach $servicos as $index => $servico %}
            <div class="col-md-4 mb-4">
                <div class="how-card">
                    <i class="bi {{ $servico['icone'] }}" style="font-size: 2rem; color: #26A69A;"></i>
                    <h3 class="hda-subtitle">{{ $servico['titulo'] }}</h3>
                    <p class="hda-text">{{ $servico['descricao'] }}</p>
                    {% if isset($servico['mais']) %}
                        <p class="hda-text mt-2">{{ $servico['mais'] }}</p>
                    {% endif; %}
                </div>
            </div>
        {% endforeach; %}
    </div>
</section>