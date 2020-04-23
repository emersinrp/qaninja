Dado("que eu tenho o seguinte produto:") do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    @product = table.hashes.first
    Database.new.delete_product(@product["nome"])
end
  
Dado("os produtores sao:") do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    @producers = table.hashes
end
  
Dado("este item já foi cadastrado") do
    steps %(
      Quando eu faço o cadastro desse item
    )
end
  
Quando("eu faço o cadastro desse item") do
    @product_page.go_to_form
    @product_page.create(@product, @producers)
end
  
Entao("devo ver este item na lista de produtos") do
    tr = @product_page.get_tr(@product["nome"])
    expect(tr).to have_text @product["categoria"]
    expect(tr).to have_text @product["preco"]
end
  
Entao("devo ver a notificaçao {string}") do |expect_notice|
    expect(@product_page.alert).to eql expect_notice
end