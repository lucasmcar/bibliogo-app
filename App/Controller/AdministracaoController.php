<?php

namespace App\Controller;

use App\Core\View\View;
use App\Helper\InputFilterHelper;
use App\Helper\JsonHelper;

class AdministracaoController
{
    public function login()
    {
        $data = [
            'titulo' => 'Acesse sua conta',
            'subtitulo' => 'Acesse sua biblioteca ou explore novos livros com o Bibliogo.',
        ];

        $styles = [
            '/assets/css/login.min.css',
        ];
        $scripts = [
            '/assets/js/login.min.js'
        ];

        return new View(view:'admin/login', vars: $data, styles: $styles, scripts: $scripts, layout: 'admin-layout');
    }
}