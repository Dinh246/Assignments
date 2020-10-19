Given('Open browser and go to tiki homepage') do
    $driver.get 'https://tiki.vn'
  end
  
  When('I search any products I want') do 
    @product_name= ''
    Kernel.puts "Please enter product you want to search:" + @product_name
    @product_name= gets.chomp
    @search_bar= $driver.find_element(:css,".eUnWAD")
    begin
        if $driver.find_element(:css, ".secondary").displayed? == true
            $driver.find_element(:css, ".secondary").click
        end
        
    rescue => exception
        @search_bar.send_keys(@product_name)
        @search_btn= $driver.find_element(:css, ".ieXBRV").click
    end
  end
  
  Then('I want to know how many products will be displayed in the first page') do
    @total= $driver.find_elements(:css, ".content").count
    Kernel.puts "The total result for #{@product_name} in the first page is #{@total}"
  end