Given(/^I'm a manager with email "(.*?)" and password "(.*?)"$/) do |email_in, pwd_in|
    @user = User.create(username: email_in, email: email_in, password: pwd_in, password_confirmation: pwd_in, cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "manager", firstname: "Men", lastname: "Ten", phone: 8364)
end

When (/^I am on the login page$/) do
  visit login_path
end

And (/^I enter email "(.*?)"$/) do |email_in|
  fill_in("Email", :with => email_in)
end

And (/^I enter password "(.*?)"$/) do |pwd_in|
  fill_in("Password", :with => pwd_in)
end

And (/^I click "(.*?)"$/) do |button|
  click_button(button)
end

And (/^I follow "(.*?)"$/) do |button|
  click_link(button)
end

Then (/^I should see my username "(.*?)"$/) do |usernam|
  page.should have_content(usernam)
end

And (/^I should see a "(.*?)" button$/) do |thisb|
  page.should have_content(thisb)
end

And (/^I should not see a "(.*?)" button$/) do |thisb|
  page.should have_no_content(thisb)
end