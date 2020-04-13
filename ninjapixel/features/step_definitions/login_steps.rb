# Abertura do Browser
Dado("que acesso à página principal") do
    visit "http://pixel-web:3000/login"
    page.current_window.resize_to(1366, 768)
end

# Login
Quando("eu submeto minhas credenciais {string} e {string}") do |email, password|
    # O hashtag e para buscar um elemento pelo ID (inspecione elemento no HTML)
    find("#emailId").set email
    find("input[name=password]").set password
    click_button "Entrar"
end

# Autenticaçao  
Então("devo ser autenticado") do
    logged_user = find(".user .info span").text
    expect(logged_user).to eql "Emerson"
end

# Desafio do Ninja
# Automatizar o cenario de senha invalida

# Senha Invalida
Quando("eu submeto minhas credenciais {string} com senha inválida {string}") do |email, incorrect_pass|
    find("#emailId").set email
    find("input[name=password]").set incorrect_pass
    click_button "Entrar"
end

# Erro Usuário e/ou senha inválidos
Então("devo ver uma mensagem de alerta {string}") do |erro_senha|
    logged_user_erro = find(".card-body .alert span").text
    expect(logged_user_erro).to eql erro_senha
end

# Email nao cadastrado
Quando("eu submeto minhas credenciais com email não cadastrado {string} com senha válida {string}") do |incorrect_email, password|
    find("#emailId").set incorrect_email
    find("input[name=password]").set password
    click_button "Entrar"
end
  

