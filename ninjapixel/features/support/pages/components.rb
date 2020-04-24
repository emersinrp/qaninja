class Sidebar < BasePage
  def logged_user
    return find(".user .info span").text
  end
end
