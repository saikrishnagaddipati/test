Given /^I request the new ([^"]*) form$/ do |form_name|
  visit "/#{form_name}s/new"
end

Given /^I fill the ([^"]*) with "(.*?)"$/ do |field_name, field_value|
  fill_in field_name.to_s.gsub(' ', '_'), with: field_value
end

Given /^I click on the button "(.*?)"$/ do |button_name|
  click_button(button_name)
  sleep 1
end

Then /^I should see "(.*?)"$/ do |must_see_string|
  page.should have_content(must_see_string)
end
