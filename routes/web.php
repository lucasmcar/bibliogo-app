<?php

use App\Middleware\AuthMiddleware;


$router->notFound(function(){
    include '../App/views/not-found/not-found.tpl';
});

$router->get('/', 'HomeController', 'index');
$router->get('/sobre', 'HomeController', 'sobre');   
$router->get('/contato', 'HomeController','contato');
$router->get('/como-funciona', 'HomeController','comoFunciona');
$router->get('/bibliotecas', 'HomeController','biblioteca');
$router->get('/cadastro', 'HomeController','cadastro');
$router->post('/cadastro/usuario', 'UsuarioController', 'registrar');

$router->group('/biblioteca', function($router) {
    $router->get('/login', 'AdministracaoController', 'login');
    $router->post('/autenticar', 'AdministracaoController', 'acessar');
    $router->get('/logout', '');
    $router->group('', function($router){
        //Biblioteca
        $router->get('/leitor', 'BibliotecaController', 'leitor');
        $router->get('/leitor/busca', 'BibliotecaController', 'buscaLivrosOuBiblioteca');
        //Leitor
        $router->get('/leitor/alugueis/ativos', 'LeitorController', 'verAtivos');
        $router->get('/leitor/alugueis/historico', 'LeitorController', 'verHistorico');
        
        $router->get('/ver/{id}', 'BibliotecaController', 'verBiblioteca');
        $router->get('/livro/{id}', 'BibliotecaController', 'verLivro');
        $router->get('/meu-cartao', 'CartaoController', 'meuCartao');
        $router->get('/cadastro/nova', 'BibliotecaController', 'telaCadastroBiblioteca');
        $router->get('/minha', 'BibliotecaController', 'minhaBiblioteca');
        $router->post('/cadastro/biblioteca', 'BibliotecaController', 'registrarBiblioteca');
        
    },[AuthMiddleware::class]);
});


$router->domain('localhost:8000', function($router) {
    $router->get('/admin', 'HomeAdminController', 'home');

    

});
       