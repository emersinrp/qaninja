
Before do
    page.current_window.resize_to(1024, 768)

    @login_page = LoginPage.new
    @product_page = ProductPage.new
    @side = Sidebar.new
end

Before("@auth") do
    @login_page.go
    @login_page.with("emersinrp@gmail.com", "123456")
end

After do
    puts "Tudo aqui acontece depois do teste!"
end