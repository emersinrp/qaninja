class ProductPage
    include Capybara::DSL
  
    def go_to_form
      find(".product-add").click
    end
  
    def create(product)
      find("input[name=title]").set product["nome"]
  
      find("input[placeholder=Gategoria]").click
      find(".el-select-dropdown__item", text: product["categoria"]).click
  
      find("input[name=price]").set product["preco"]
  
      find("textarea[name=description]").set product["descricao"]
  
      click_button "Cadastrar"
    end
  end