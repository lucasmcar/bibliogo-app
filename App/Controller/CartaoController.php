<?php 

namespace App\Controller;

use App\Core\View\View;

class CartaoController
{
    public function gerarCartao()
    {

    }

    public function meuCartao()
    {
        $data = [
            'titulo' => 'Seu Cartão Virtual Bibliogo',
            'subtitulo' => 'Apresente este cartão ao dono do livro para registrar seu aluguel.',
            'usuario' => [
                'nome' => 'Lucas Martins de Carvalho',
                'data_cadastro' => date('d/m/Y')
            ]
        ];

        $scripts = [
            '/assets/js/meu-cartao.min.js'
        ];

        $styles = [
            '/assets/css/admin/meu-cartao.min.css'
        ];

        return new View(
            view: 'admin/cartao-virtual/cartao-virtual', 
            vars: $data, 
            styles: $styles, 
            scripts: $scripts, 
            layout: 'admin-layout' 
        );
    }
}