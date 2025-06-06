<!-- Página Login -->
<section class="container hda-section">
    <h2 class="hda-title">{{ $titulo }}</h2>
    <p class="hda-text">{{ $subtitulo }}</p>

    <form id="loginForm" class="login-form" method="POST" action="/biblioteca/autenticar">
        @csrf
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" class="form-control" required placeholder="seu@email.com">
        </div>
        <div class="form-group">
            <label for="password">Senha</label>
            <input type="password" id="password" name="senha" class="form-control" required placeholder="Digite sua senha">
        </div>
        <button type="submit" id="btnLogin" class="btn btn-bibliogo">Entrar</button>
        <p class="hda-text mt-3 text-center">
            <a href="/recuperar-senha" class="forgot-password">Esqueceu sua senha?</a>
        </p>
    </form>
</section>