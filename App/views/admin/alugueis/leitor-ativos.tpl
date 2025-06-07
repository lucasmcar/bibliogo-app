<!-- Página de Aluguéis Ativos -->
<section class="container alugueis-section">
    <h2 class="alugueis-title">Seus Aluguéis Ativos</h2>
    <p class="alugueis-text">Veja os livros que você está alugando atualmente.</p>

    <div class="alugueis-list">
        {% foreach $alugueis as $index => $aluguel %}
            <div class="aluguel-item" v-for="aluguel in alugueis">
                
                <div class="aluguel-details">
                    <h3 class="aluguel-titulo">{{ $aluguel['livro_titulo'] }}</h3>
                    <p><span class="label">Biblioteca:</span> {{ $aluguel['biblioteca_nome'] }}</p>
                    <p><span class="label">Valor Pago:</span> R$ {{ $aluguel['valor_pago'] }}</p>
                    <p><span class="label">Data de Retirada:</span> {{ $aluguel['data_retirada'] }}</p>
                    <p><span class="label">Tempo de Leitura:</span> {{ $aluguel['tempo_leitura'] }} dias</p>
                </div>
                <div class="aluguel-actions">
                    <button class="btn btn-bibliogo" @click="devolverAluguel($aluguel['id'])">Devolver</button>
                </div>
            
            </div>
        {% endforeach; %}
        </div>
    </div>
</section>
