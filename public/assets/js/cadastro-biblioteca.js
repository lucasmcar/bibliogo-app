document.addEventListener('DOMContentLoaded', function () {

    const bibliotecaForm = document.getElementById('cadastroBibliotecaForm');

    if (bibliotecaForm) {
        bibliotecaForm.addEventListener('submit', function (e) {

            e.preventDefault();

            const formData = new FormData(bibliotecaForm);

            fetch('/cadastro/nova', {
                method: 'POST',
                body: formData,
            }).then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('Biblioteca cadastrada com sucesso');
                    } else {
                        
                        alert(data.error || 'Erro ao adicionar biblioteca.');
                    }
                }

                ).catch(error => {
                    console.error("Erro:" + error)
                });
        });

    }


});