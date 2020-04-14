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
    [tags]  smoke
    Dado que eu tenho o seguinte produto
    ...     Pitfall      Aventura na Selva       19.99       10      #(Argumentos recebidos)
    E acesso o portal de cadastro de jogos
    Quando eu faco o cadastro desse item   
    Entao vejo a mensagem de sucesso "Produto cadastrado com sucesso."
    E vejo este novo jogo na lista

Jogo nao pode ser duplicado
    [tags]  dup
    Dado que eu tenho o seguinte produto
    ...     Fortnite      Melhor Batlle Royale   20.50       10
    E acesso o portal de cadastro de jogos
    Mas este produto ja foi cadastrado
    Quando eu faco o cadastro desse item
    Entao devo ver a mensagem de alerta: "Nome já está em uso"

Nome deve ser obrigatorio
    [Template]      Tentar Cadastrar
    ${EMPTY}     19.99       10         Nome não pode ficar em branco

Preco deve ser obrigatorio
    ## [tags] bug (roda somenteo esse cenario - robot -d ./log -i bug tests/cadastro.robot)
    [Template]      Tentar Cadastrar
    Pitfall       ${EMPTY}    10        Preco não pode ficar em branco

Quantidade deve ser obrigatorio
    [Template]      Tentar Cadastrar
    Pitfall         19.99       ${EMPTY}       Quantidade não pode ficar em branco  

*** Keywords ***
Tentar Cadastrar
    [Arguments]         ${nome}        ${preco}        ${qtd}       ${texto}

    Dado que eu tenho o seguinte produto
    ...     ${nome}      Aventura na Selva       ${preco}       ${qtd}  #(Argumentos recebidos)
    E acesso o portal de cadastro de jogos
    Quando eu faco o cadastro desse item   
    Entao devo ver a mensagem de alerta: "${texto}"