<?php

namespace App\Controller;

use App\Core\View\View;
use App\Helper\InputFilterHelper;
use App\Core\Security\Jwt\JwtHandler;
use App\Core\Security\Csrf;
use App\Model\Usuario;

class BibliotecaController
{

    public function telaCadastroBiblioteca()
    {
        $data = [
            'titulo' => 'Cadastrar Nova Biblioteca',
            'subtitulo' => 'Registre sua coleção de livros com a BiblioGo',
        ];


        $styles = [
            '/assets/css/admin/cadastro-biblioteca.min.css'
        ];
        $scripts= [
            'assets/js/cadastro-biblioteca.min.js'
        ];

        return new View(
            view: 'admin/biblioteca/cadastro-biblioteca',
            vars: $data,
            styles: $styles,
            scripts: $scripts,
            layout: 'admin-layout'
        );

    }

    public function minhaBiblioteca()
    {

    }

    public function registrarBiblioteca()
    {
        
    }

    public function leitor()
    {
        $dados = [];
        if (session_id()) {
            $dados = JwtHandler::validateToken($_SESSION['jwt']);
            $usuario = new Usuario();
        }

        $usuarioDado = $usuario->findForSign($dados['email']);
        


        $data = [
            'titulo' => "Bem-vindo ao seu Dashboard, ".$usuarioDado[0]['usuario'],
            'subtitulo' => 'Gerencie seus aluguéis e acesse seu cartão virtual.'
        ];

        $styles = [
            '/assets/css/admin/dashboards/leitor.min.css'
        ];

        $scripts = [
            '/assets/js/busca-livro-leitor.min.js'
        ];

        return new View(view: 'admin/dashboard/leitor', vars: $data, styles: $styles, scripts: $scripts, layout: 'admin-layout');
    }

    public function buscaLivrosOuBiblioteca($params)
    {
        $slug = $params['q'] ?? '';

        // Dados fictícios para teste
        $dados = [
            'livros' => [],
            'bibliotecas' => []
        ];

        // Se houver termo de busca, filtrar dados fictícios
        if (!empty($slug)) {
            // Dados fictícios de bibliotecas
            $bibliotecas = [
                ['id' => 1, 'nome' => 'Biblioteca do João', 'descricao' => 'Coleção de livros de ficção e aventura'],
                ['id' => 2, 'nome' => 'Estante da Maria', 'descricao' => 'Livros de autoajuda e desenvolvimento pessoal'],
                ['id' => 3, 'nome' => 'Acervo do Pedro', 'descricao' => 'Focado em história e biografias']
            ];

            // Dados fictícios de livros
            $livros = [
                ['id' => 1, 'titulo' => 'O Senhor dos Anéis', 'autor' => 'J.R.R. Tolkien', 'biblioteca_nome' => 'Biblioteca do João'],
                ['id' => 2, 'titulo' => 'A Arte de Viver', 'autor' => 'Dalai Lama', 'biblioteca_nome' => 'Estante da Maria'],
                ['id' => 3, 'titulo' => 'História do Brasil', 'autor' => 'Laurentino Gomes', 'biblioteca_nome' => 'Acervo do Pedro']
            ];

            // Filtrar com base no termo de busca (simulação simples)
            $dados['bibliotecas'] = array_filter($bibliotecas, function ($item) use ($slug) {
                return stripos($item['nome'], $slug) !== false || stripos($item['descricao'], $slug) !== false;
            });

            $dados['livros'] = array_filter($livros, function ($item) use ($slug) {
                return stripos($item['titulo'], $slug) !== false || stripos($item['autor'], $slug) !== false || stripos($item['biblioteca_nome'], $slug) !== false;
            });

            // Converter para array novamente após filtragem
            $dados['bibliotecas'] = array_values($dados['bibliotecas']);
            $dados['livros'] = array_values($dados['livros']);
        }

        // Retornar como JSON
        header('Content-Type: application/json');
        echo json_encode($dados);
        exit;
    }

    public function verLivro()
    {

    }

    public function verBiblioteca()
    {

    }
}