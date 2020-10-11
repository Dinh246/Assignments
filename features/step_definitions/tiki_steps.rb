Given ('launch browser and go to tiki homepage') do
    $driver.manage.window.maximize
    $driver.get 'https://tiki.vn/' 
end
When('I search {string}, select Tiki Now, choose the fifth product, add {int} products to cart and go to checkout') do |string, int|    $search = $driver.find_element(:css, "input[type='text']").send_keys(string)
    @product_page = $driver.find_element(:css, 'button.FormSearch__Button-sc-1fwg3wo-3').click
    sleep 10
    @sub_tiki = $driver.find_element(:css, "button#onesignal-slidedown-cancel-button.align-right").click
    @tiki_now = $driver.find_element(:css, 'label.checkbox:nth-child(2)').click
    @apply = $driver.find_element(:css,".apply-btn").click
    @options = $driver.find_elements(css: "select.form-control")
    @select_object = Selenium::WebDriver::Support::Select.new(@options[0])
    @city = @select_object.select_by(:index, 2)
    @select_object = Selenium::WebDriver::Support::Select.new(@options[1])
    @district = @select_object.select_by(:text, "Quận Đống Đa")
    @select_object = Selenium::WebDriver::Support::Select.new(@options[2])
    @ward = @select_object.select_by(:text, "Phường Phương Liên")
    $driver.find_element(:css,".apply-btn").click
    @fifth_product = $driver.find_element(:xpath, "//p[contains(text(),'Tai Nghe Bluetooth Nhét Tai Apple AirPods 2...')]")
    @fifth_product.click
    expect($driver.title).to include('Tai Nghe Bluetooth Nhét Tai Apple AirPods 2')
    @add_2 = $driver.find_element(:xpath, "//button[contains(text(),'+')]").click
    @check_out = $driver.find_element(:css, 'span.tikicon').click
    @msg = $driver.find_element(:xpath, "//p[contains(text(),'Sản phẩm Tai Nghe Bluetooth Nhét Tai Apple AirPods')]").text
    Kernel.puts @msg
    @add_1 = $driver.find_element(:xpath, "//button[contains(text(),'-')]").click
    @buy = $driver.find_element(:css, ".icon-add-to-cart2x").click
    @check_out = $driver.find_element(:css, "a.btn-view-cart").click
end
Then ('I should see the quantity and the total cost in cart') do
    $driver.manage.timeouts.implicit_wait = 5
    @qty = $driver.find_element(:css, ".cart-products__count").text
    @quant = $driver.find_element(:css, ".qty-input").text
    Kernel.puts @quant.to_i
    Kernel.puts "Quantity: #{@qty}"
    @real_price = $driver.find_element(:css, ".cart-products__real-prices").text
    @total = $driver.find_element(:css, 'span.prices__value--final').text
    Kernel.puts "Total price: #{@total}"
    expect(@total).to include(@real_price)
end