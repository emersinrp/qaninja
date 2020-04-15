Dado("que acesso à página principal") do
    @login_page.go
end
  
Quando("eu submeto minhas credenciais {string} e {string}") do |email, password|
    # O hastag é para buscar um elemento pelo ID (Inspecione o elemento para ver)
    @login_page.with(email, password)
end
  
Então("devo ser autenticado") do
    expect(@side.logged_user).to eql "Emerson"
end
  
Então("devo ver uma mensagem de alerta {string}") do |expect_alert|
    expect(@login_page.alert).to eql expect_alert
end