require 'rubygems'
require "selenium-webdriver"

@driver = Selenium::WebDriver.for :firefox

def wait_for_ajax
  begin
    puts "Waiting to login, and AJAX to finish"
    sleep 0.3
  end while (@driver.execute_script("return jQuery.active") != 0)
    puts "\n\nAJAX loaded!!\n\n"
end


begin
  @driver.navigate.to "http://www.reddit.com/"
  @driver.find_element(:name, "user").send_keys("selenium_test_user")
  @driver.find_element(:name, "passwd").send_keys("123456")
  @driver.find_element(:name, "passwd").submit
  wait_for_ajax
ensure
  @driver.quit
end
