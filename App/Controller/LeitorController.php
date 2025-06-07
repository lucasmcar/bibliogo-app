<?php

namespace App\Controller;

use App\Core\View\View;
use App\Core\Security\Jwt\JwtHandler;
use App\Model\Usuario;

class LeitorController
{
    public function verHistorico() {}

    public function verAtivos()
    {
        // Simulação de dados fictícios para aluguéis ativos
        $alugueis = [
            [
                'id' => 1,
                'livro_titulo' => 'O Senhor dos Anéis',
                'biblioteca_nome' => 'Biblioteca do João',
                'valor_pago' => 15.00,
                'data_retirada' => '2025-06-01',
                'tempo_leitura' => 5 // Dias desde a retirada até hoje (06/06/2025)
            ],
            [
                'id' => 2,
                'livro_titulo' => 'A Arte de Viver',
                'biblioteca_nome' => 'Estante da Maria',
                'valor_pago' => 10.00,
                'data_retirada' => date('d/m/Y', strtotime('2025-06-03')),
                'tempo_leitura' => 3
            ],
            [
                'id' => 3,
                'livro_titulo' => 'História do Brasil',
                'biblioteca_nome' => 'Acervo do Pedro',
                'valor_pago' => 12.50,
                'data_retirada' => '2025-06-05',
                'tempo_leitura' => 1
            ]
        ];

        // Dados do usuário autenticado (simulado via JWT)
        $dados = [];
        if (session_id()) {
            $dados = JwtHandler::validateToken($_SESSION['jwt']);
            $usuario = new Usuario();
        }
        $usuarioDado = $usuario->findForSign($dados['email']);

        $data = [
            'titulo' => "Seus Aluguéis Ativos, " . $usuarioDado[0]['usuario'],
            'subtitulo' => 'Veja os livros que você está alugando atualmente.',
            'alugueis' => $alugueis
        ];

        $styles = [
            '/assets/css/admin/alugueis/leitor-ativos.min.css'
        ];

        $scripts = [
            '/assets/js/leitor-ativos.min.js'
        ];

        return new View(view: 'admin/alugueis/leitor-ativos', vars: $data, styles: $styles, scripts: $scripts, layout: 'admin-layout');
    }
}
