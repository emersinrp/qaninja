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

# Exclusão do produto

Dado("que {string} é um produto indesejado") do |product_key|
  # para não dar erro ao cadastrar produto
  # porque passaremos um array vazio
  @producers = []

  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/products.yaml"))
  @product = file[product_key]

  Database.new.delete_product(@product["nome"])

  steps %(
    Quando eu faço o cadastro desse item
  )
end

Quando("eu solicito a exclusão desse item") do
  @product_page.remove(@product["nome"])
end

Quando("confirmo a solicitação") do
  @product_page.confirm_removal
end

Quando("eu cancelo a solicitação") do
  @product_page.cancel_removal
end

Então("não devo ver este item na lista") do
  expect(
    @product_page.has_no_product?(@product["name"])
  ).to be true
end

Então("este item deve permanecer na lista") do
  steps %(
    Entao devo ver este item na lista de produtos
  )
end
