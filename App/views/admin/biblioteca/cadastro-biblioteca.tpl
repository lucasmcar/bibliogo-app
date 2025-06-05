<!-- Tela de Cadastro de Biblioteca -->
<section class="container cadastro-section">
    <h2 class="cadastro-title">{{ $titulo }}</h2>
    <p class="cadastro-text">{{ $subtitulo }}</p>

    <form id="cadastroBibliotecaForm" class="cadastro-form" method="POST" action="/admin/biblioteca/cadastro/biblioteca">
        <div class="form-group">
            <label for="nome">Nome da Biblioteca</label>
            <input type="text" id="nome" name="nome" class="form-control" required placeholder="Ex.: Minha Biblioteca Pessoal">
        </div>
        <div class="form-group">
            <label for="descricao">Descrição (Opcional)</label>
            <textarea id="descricao" name="descricao" class="form-control" rows="4" placeholder="Descreva sua biblioteca..."></textarea>
        </div>
        <button type="submit" class="btn btn-bibliogo">Cadastrar Biblioteca</button>
    </form>
</section>