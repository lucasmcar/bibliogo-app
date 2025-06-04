document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('loginForm');
    if (form) {
        form.addEventListener('submit', function (e) {
            e.preventDefault();

            const email = document.getElementById('email').value.trim();
            const password = document.getElementById('password').value.trim();

            if (!email || !password) {
                alert('Por favor, preencha todos os campos.');
                return;
            }

            if (!/^\S+@\S+\.\S+$/.test(email)) {
                alert('Por favor, insira um email válido.');
                return;
            }

            if (password.length < 6) {
                alert('A senha deve ter pelo menos 6 caracteres.');
                return;
            }

            // Simulação de envio (substitua pela chamada real ao backend)
            console.log('Formulário de login enviado:', { email, password });
            alert('Login realizado com sucesso! Redirecionando...');
            form.reset();
            window.location.href = '/';
        });
    }
});