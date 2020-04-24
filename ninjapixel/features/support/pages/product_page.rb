class ProductPage < BasePage
  # construtor / inicializador
  def initialize
    @product_list = "table tbody tr"
  end

  def go_to_form
    find(".product-add").click
  end

  def create(product, producers)
    find("input[name=title]").set product["nome"]
    select_category(product["categoria"])
    find("input[name=price]").set product["preco"]
    input_producers(producers) if producers.size > 0
    find("textarea[name=description]").set product["descricao"]
    upload(product["imagem"])

    click_button "Cadastrar"
  end

  def remove(name)
    found = get_tr(name)
    # escopo
    found.find(".btn-trash").click
  end

  def confirm_removal
    find(".swal2-confirm").click
  end

  def cancel_removal
    find(".swal2-cancel").click
  end

  def get_tr(target)
    return find(@product_list, text: target)
  end

  def has_no_product?(name)
    # se não existe o produto, retornará true (verdadeiro)
    # porque ele não existe
    return page.has_no_css?(@product_list, text: name)
  end

  def alert
    return find(".alert").text
  end

  private

  def select_category(cat)
    find("input[placeholder=Gategoria]").click

    element = ".el-select-dropdown__item"
    page.has_css?(element, text: cat, match: :prefer_exact)
    ### CORRIGIR SLEEP - PALEATIVO ###
    sleep 0.5
    find(element, text: cat, match: :prefer_exact).click
  end

  def upload(image)
    rel_path = "features/support/images/" + image
    image_file = File.join(Dir.pwd, rel_path)

    Capybara.ignore_hidden_elements = false
    attach_file("upcover", image_file)
    Capybara.ignore_hidden_elements = true
  end

  def input_producers(producers)
    producers_element = find(".producers")

    producers.each do |p|
      producers_element.set p["produtor"]
      producers_element.send_keys :tab
    end
  end
end
