document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.getElementById('search-input');
    const searchButton = document.getElementById('search-button');
    const searchResults = document.getElementById('search-results');
    const searchContainer = document.querySelector('.search-container');

    // Função para realizar a busca
    async function performSearch(query) {
        if (query.length < 2) {
            searchResults.innerHTML = '';
            searchResults.classList.remove('active');
            return;
        }

        try {
            const response = await fetch(`/biblioteca/leitor/busca?q=${encodeURIComponent(query)}`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('input[name="_csrf_token"]')?.value
                }
            });

            if (!response.ok) {
                throw new Error('Erro na busca');
            }

            const data = await response.json();
            displayResults(data);
        } catch (error) {
            console.error('Erro ao realizar busca:', error);
            searchResults.innerHTML = '<div class="result-item"><p>Erro ao realizar a busca. Tente novamente.</p></div>';
            searchResults.classList.add('active');
        }
    }

    // Função para exibir os resultados
    function displayResults(data) {
        searchResults.innerHTML = '';

        if (!data.livros.length && !data.bibliotecas.length) {
            searchResults.innerHTML = '<div class="result-item"><p>Nenhum resultado encontrado.</p></div>';
            searchResults.classList.add('active');
            return;
        }

        if (data.bibliotecas.length) {
            const bibliotecaSection = document.createElement('div');
            bibliotecaSection.innerHTML = '<h4>Bibliotecas</h4>';
            data.bibliotecas.forEach(biblioteca => {
                const item = document.createElement('div');
                item.classList.add('result-item');
                item.innerHTML = `
                    <h4>${biblioteca.nome}</h4>
                    <p>${biblioteca.descricao ? biblioteca.descricao.slice(0, 100) + '...' : 'Sem descrição'}</p>
                    <a href="/biblioteca/${biblioteca.id}">Ver Biblioteca</a>
                `;
                bibliotecaSection.appendChild(item);
            });
            searchResults.appendChild(bibliotecaSection);
        }

        if (data.livros.length) {
            const livroSection = document.createElement('div');
            livroSection.innerHTML = '<h4>Livros</h4>';
            data.livros.forEach(livro => {
                const item = document.createElement('div');
                item.classList.add('result-item');
                item.innerHTML = `
                    <h4>${livro.titulo}</h4>
                    <p>Autor: ${livro.autor || 'Desconhecido'} | Biblioteca: ${livro.biblioteca_nome || 'Sem biblioteca'}</p>
                    <a href="/livro/${livro.id}">Ver Livro</a>
                `;
                livroSection.appendChild(item);
            });
            searchResults.appendChild(livroSection);
        }

        searchResults.classList.add('active');
    }

    // Evento de digitação (debounce para evitar muitas requisições)
    let debounceTimer;
    searchInput.addEventListener('input', function () {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            performSearch(this.value.trim());
        }, 300);
    });

    // Evento de clique no botão de busca
    searchButton.addEventListener('click', function () {
        performSearch(searchInput.value.trim());
    });

    // Fechar resultados ao clicar fora
    document.addEventListener('click', function (e) {
        if (!searchContainer.contains(e.target)) {
            searchResults.innerHTML = '';
            searchResults.classList.remove('active');
        }
    });
});