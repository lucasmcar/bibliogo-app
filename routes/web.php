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
$router->post('/registro/usuario', 'UsuarioController', 'registrar');

$router->group('/biblioteca', function($router) {
    $router->get('/login', 'AdministracaoController', 'login');
    $router->get('/logout', '');
    $router->group('', function($router){
        
    },[AuthMiddleware::class]);
});


$router->domain('localhost:8000', function($router) {
    $router->get('/admin', 'HomeAdminController', 'home');

    

});
       