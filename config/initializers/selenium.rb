if Rails.env.test?
    require 'selenium-webdriver'

    firefox_path = '/Applications/Additionals/Firefox.app/Contents/MacOS/firefox'
    Selenium::WebDriver::Firefox::Binary.path = firefox_path

    puts "\n\n***** NOTICE: The path to firefox to run selenium is #{firefox_path}.\nIf your path to firefox is different, modify config/initializers/selenium.rb.\n\n"
end