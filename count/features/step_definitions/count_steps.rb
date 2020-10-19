Given('Open browser and go to tiki homepage') do
    $driver.get 'https://tiki.vn'
  end
  
  When('I search anything such as: {string}') do |string|
    @product_name= string
    Kernel.puts "Please enter product you want to search:" + @product_name
    @product_name= gets.chomp
    @search_bar= $driver.find_element(:css,".eUnWAD")
    @sub = $driver.find_element(:css, ".secondary")
    if @sub.displayed? == true
        @sub.click
        @search_bar.send_keys(@product_name)
        @search_btn= $driver.find_element(:css, ".ieXBRV").click
    else
        @search_bar.send_keys(@product_name)
        @search_btn= $driver.find_element(:css, ".ieXBRV").click
    end    
  end
  
  Then('I want to know how many products will be displayed in the first page') do
    @total= $driver.find_elements(:css, ".content").count
    Kernel.puts "The total result for #{@product_name} in the first page is #{@total}"
  end