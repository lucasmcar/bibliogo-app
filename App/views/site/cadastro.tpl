<!-- Página Cadastro -->
<section class="container hda-section">
    <h2 class="hda-title">Crie Sua Conta</h2>
    <p class="hda-text">Registre-se como leitor ou dono de livros para começar a usar o Bibliogo.</p>

    <form id="cadastroForm" class="cadastro-form" method="POST">
        @csrf
        <div class="form-group">
            <label for="nome">Nome completo</label>
            <input type="text" id="nome" name="nome" class="form-control" required placeholder="Seu nome completo">
        </div>    
        <div class="form-group">
            <label for="usuario">Nome de Usuário</label>
            <input type="text" id="usuario" name="usuario" class="form-control" required placeholder="Escolha um nome de usuário">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" class="form-control" required placeholder="seu@email.com">
        </div>
        <div class="form-group">
            <label for="senha">Senha</label>
            <input type="password" id="senha" name="senha" class="form-control" required placeholder="Crie uma senha">
        </div>
        <div class="form-group">
            <label for="localizacao">Localização (Cidade ou Região)</label>
            <input type="text" id="localizacao" name="localizcao" class="form-control" required placeholder="Ex.: São Paulo">
        </div>
        <div class="form-group">
            <label for="tipo">Tipo de Usuário</label>
            <select id="tipo" name="tipo" class="form-control" required>
                <option value="leitor">Leitor</option>
                <option value="dono">Dono de Livros</option>
                <option value="ambos">Ambos</option>
            </select>
        </div>
        <button type="submit" id="salvarUsuario" class="btn btn-bibliogo">Cadastrar</button>
    </form>
</section>