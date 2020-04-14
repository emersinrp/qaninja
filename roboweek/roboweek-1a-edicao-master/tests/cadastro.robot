*** Settings ***
Documentation   Cadastro de jogos

Resource        resources/keywords.robot

Suite Setup         Inicia Sessao
Suite Teardown      Encerra Sessao
Test Teardown       Depois do Teste

#especificacoes BDD (desenvolvimento guiado por comportamento)
#especificacoes ATDD (desenvolvimento guiado por testes de aceitacao)

*** Test Cases ***
Cadastrar novo jogo
    [tags] smoke
    Dado que acesso ao portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     Pitfall      Aventura na Selva       19.99       10       #(Argumentos recebidos)
    Entao vejo a mensagem de sucesso "Produto cadastrado com sucesso."
    E vejo este novo jogo na lista

Nome deve ser obrigatorio
    Dado que acesso ao portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...    ${EMPTY}     Aventura na Selva       19.99       10       #(Argumentos recebidos)
    Entao devo ver a mensagem de alerta: "Nome não pode ficar em branco"

Preco deve ser obrigatorio
    ## [tags] bug (roda somenteo esse cenario - robot -d ./log -i bug tests/cadastro.robot)
    Dado que acesso ao portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...    Pitfall      Aventura na Selva       ${EMPTY}    10       #(Argumentos recebidos)
    Entao devo ver a mensagem de alerta: "Preco não pode ficar em branco"

Quantidade deve ser obrigatorio
    Dado que acesso ao portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     Pitfall      Aventura na Selva       19.99       ${EMPTY}  #(Argumentos recebidos)
    Entao devo ver a mensagem de alerta: "Quantidade não pode ficar em branco"

