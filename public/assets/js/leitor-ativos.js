document.addEventListener('DOMContentLoaded', function () {
    function devolverAluguel(id) {
        if (confirm('Tem certeza que deseja devolver este aluguel?')) {
            fetch(`/api/leitor/devolver/${id}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('input[name="_csrf_token"]')?.value
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Aluguel devolvido com sucesso!');
                    location.reload();
                } else {
                    alert('Erro ao devolver o aluguel. Tente novamente.');
                }
            })
            .catch(error => console.error('Erro:', error));
        }
    }

    // Vincular a função ao botão
    document.querySelectorAll('.btn-bibliogo').forEach(button => {
        button.addEventListener('click', function () {
            const aluguelId = this.getAttribute('data-id');
            devolverAluguel(aluguelId);
        });
    });
});