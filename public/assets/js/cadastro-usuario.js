document.addEventListener('DOMContentLoaded', function () {

    const btnSalvarUsuario = document.getElementById('salvarUsuario');

    btnSalvarUsuario.addEventListener('click', function () {

        const form = document.getElementById('cadastroForm');
        const formData = new FormData(form);
        const data = Object.fromEntries(formData);
        const csrfToken = document.querySelector('input[name="_csrf_token"]')?.value;
        if (!csrfToken) {
            console.error('Token CSRF não encontrado. Verifique o HTML.');
        }

        if (form) {
            
            fetch('/cadastro/usuario', {
                method: 'POST',
                headers: {
                    "X-Requested-With": "XMLHttpRequest",
                    'X-CSRF-TOKEN': csrfToken,
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({...data, _csrf_token: csrfToken})
            })
            .then(resultado => resultado.json())
            .then(data => {
                return data;
            })
            .catch(error => {
                console.error("Erro: " + error);
            })

        }

    });



})