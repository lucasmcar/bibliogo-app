<!-- Página Cadastro -->
<section class="container hda-section">
    <h2 class="hda-title">Crie Sua Conta</h2>
    <p class="hda-text">Registre-se como leitor ou dono de livros para começar a usar o Bibliogo.</p>

    <form id="cadastroForm" class="cadastro-form" method="POST" action="/cadastro">
        <div class="form-group">
            <label for="username">Nome de Usuário</label>
            <input type="text" id="username" name="username" class="form-control" required placeholder="Escolha um nome de usuário">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" class="form-control" required placeholder="seu@email.com">
        </div>
        <div class="form-group">
            <label for="password">Senha</label>
            <input type="password" id="password" name="password" class="form-control" required placeholder="Crie uma senha">
        </div>
        <div class="form-group">
            <label for="location">Localização (Cidade ou Região)</label>
            <input type="text" id="location" name="location" class="form-control" required placeholder="Ex.: São Paulo">
        </div>
        <div class="form-group">
            <label for="role">Tipo de Usuário</label>
            <select id="role" name="role" class="form-control" required>
                <option value="reader">Leitor</option>
                <option value="owner">Dono de Livros</option>
                <option value="both">Ambos</option>
            </select>
        </div>
        <button type="submit" class="btn btn-bibliogo">Cadastrar</button>
    </form>
</section>