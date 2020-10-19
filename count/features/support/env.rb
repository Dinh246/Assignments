require 'webdrivers'
require 'selenium-webdriver'
require 'rspec'
require 'cucumber'
require 'rubygems'
$driver = Selenium::WebDriver.for :firefox
$wait = Selenium::WebDriver::Wait.new(:timeout => 40)

at_exit do
    $driver.quit
end