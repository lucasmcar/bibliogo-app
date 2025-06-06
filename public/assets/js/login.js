document.addEventListener('DOMContentLoaded', function () {

    const btnLogin = document.getElementById('btnLogin');

    btnLogin.addEventListener('click', function () {
        
        const formLogin = document.getElementById('loginForm');

        const formData = new FormData(formLogin);
        const data = Object.fromEntries(formData);
        
        const csrfToken = document.querySelector('input[name="_csrf_token"]')?.value;

        if (!csrfToken) {
            console.error('Token CSRF não encontrado. Verifique o HTML.');
        }

        if (formLogin) {

            fetch('/biblioteca/autenticar',
                {
                    method: 'POST',
                    headers: {
                        "X-Requested-With": "XMLHttpRequest",
                        'X-CSRF-TOKEN': csrfToken,
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({...data, _csrf_token: csrfToken})
                }

            ).then(resposta => resposta.json())
            .then(data => {
                return data;
            })
            .catch(error => {
                console.error("Erro: " + error);
            });

        }

    });


});