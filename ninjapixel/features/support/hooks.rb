require "report_builder"

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

After do |scenario|
  # O capybara tira o screenshot
  screenshot = page.save_screenshot("logs/screenshots/#{scenario.__id__}.png")
  # O Cucumber anexa o screenshot no relatório para gerar evidência!
  embed(screenshot, "image/png", "Screenshot")
end

at_exit do
  ReportBuilder.configure do |config|
    config.report_title = "Ninja Pixel"
    config.input_path = "logs/report.json"
    config.report_path = "logs/report"
    config.report_types = [:html]
    config.color = "indigo"
  end
  ReportBuilder.build_report
end
