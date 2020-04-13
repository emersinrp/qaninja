#language:pt

Funcionalidade: Login

    Para que eu possa gerenciar os jogos do meu catálogo NinjaPixel
    Sendo um Administrador de catálogo
    Posso acessar o sistema com meu e-mail e senha

Cenario: Acessar o portal

    Dado que acesso à página principal
    Quando eu submeto minhas credenciais "emersinrp@gmail.com" e "123456"
    Então devo ser autenticado

Cenario: Senha inválida

    Dado que acesso à página principal
    Quando eu submeto minhas credenciais "emersinrp@gmail.com" com senha inválida "pwdteste"
    Então devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

@doing
Cenario: Email não cadastrado no sistema

    Dado que acesso à página principal
    Quando eu submeto minhas credenciais com email não cadastrado "teste@teste.com" com senha válida "123456"
    Então devo ver uma mensagem de alerta "Usuário e/ou senha inválidos"

Cenario: Não informo o email

    Dado que acesso à página principal
    Quando eu submeto minhas credenciais sem o email
    Então devo ver uma mensagem de alerta "Opps. Informe o seu email!" 

Cenario: Não informo a senha

    Dado que acesso à página principal
    Quando eu submeto minhas credenciais sem a senha
    Então devo ver uma mensagem de alerta "Opps. Informe a sua senha!"