class LoginPage < BasePage
  def go
    visit "http://pixel-web:3000/login"
  end

  def with(email, pass)
    find("#emailId").set email
    find("input[name=password]").set pass
    click_button "Entrar"
  end

  def alert
    return find(".alert").text
  end
end
