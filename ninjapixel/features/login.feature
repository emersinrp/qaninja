#language:pt

Funcionalidade: Login
    Para que eu possa gerenciar os jogos do meu catálogo NinjaPixel
    Sendo um Administrador de catálogo
    Posso acessar o sistema com meu e-mail e senha

    Contexto:
        Dado que acesso à página principal

    Cenario: Acessar o portal

        Quando eu submeto minhas credenciais "emersinrp@gmail.com" e "123456"
        Então devo ser autenticado

    Esquema do Cenario: Tentar logar

        Quando eu submeto minhas credenciais "<email>" e "<senha>"
        Então devo ver uma mensagem de alerta "<texto>"

        Exemplos:
            | email                 | senha  | texto                        |
            | emersinrp@gmail.com   | pwd123 | Usuário e/ou senha inválidos |
            | 404@gmail.com         | 123456 | Usuário e/ou senha inválidos |
            |                       | 123456 | Opps. Informe o seu email!   |
            | emersinrp@gmail.com   |        | Opps. Informe a sua senha!   |