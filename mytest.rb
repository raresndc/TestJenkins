require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get "http://cristianciurea.ase.ro/ruby/Login.html"

sleep 5

element = driver.find_element :name => "Username"
element.send_keys "cristi"

sleep 5

element = driver.find_element :name => "Password"
element.send_keys "cristi"

#driver.find_element(:name, "Login").click
element = driver.find_element :name => "Login"
element.click

sleep 5

a = driver.switch_to.alert
if a.text == 'Utilizatorul tau este: cristi'
  sleep 3
  a.accept
  puts "Test Passed!"
else
  sleep 3
  a.dismiss
end

driver.quit