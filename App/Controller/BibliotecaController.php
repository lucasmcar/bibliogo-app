<?php

namespace App\Controller;

use App\Core\View\View;
use App\Helper\InputFilterHelper;
use App\Core\Security\Jwt\JwtHandler;
use App\Core\Security\Csrf;

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
        $data = [
            'titulo' => 'Bem-vindo ao seu Dashboard, [Nome do Leitor]',
            'subtitulo' => 'Gerencie seus aluguéis e acesse seu cartão virtual.'
        ];

        $styles = [
            'assets/css/admin/dashboards/leitor.min.css'
        ];

        $scripts = [];

        return new View(view: 'admin/dashboard/leitor', vars: $data, styles: $styles, scripts: $scripts, layout: 'admin-layout');
    }
}