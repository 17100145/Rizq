Given (/^I am on the signup page$/) do
  visit signup_path
end

And (/^I choose password "(.*?)"$/) do |pwd_in|
  fill_in("Password", :with => pwd_in)
  fill_in("Confirmation", :with => pwd_in)
end

And (/^I fill in my other details$/) do
  fill_in("Firstname", :with => "First")
  fill_in("Lastname", :with => "Last")
  fill_in("Username", :with => "User")
  fill_in("Email", :with => "email@gmail.com")
  fill_in("Cnic", :with => "123456")
  fill_in("Age", :with => "12")
  fill_in("Address", :with => "Narnia")
  fill_in("Organization", :with => "Rizq")
  select("donor", :from => "Designation")
  fill_in("Phone", :with => "1234")
end

And (/^I fill in all details as "(.*?)"$/) do |userin|
  fill_in("Firstname", :with => "First")
  fill_in("Lastname", :with => "Last")
  fill_in("Username", :with => userin)
  fill_in("Email", :with => "email@gmail.com")
  fill_in("Password", :with => "pwd12345")
  fill_in("Confirmation", :with => "pwd12345")
  fill_in("Cnic", :with => "123456")
  fill_in("Age", :with => "12")
  fill_in("Address", :with => "Narnia")
  fill_in("Organization", :with => "Rizq")
  select("donor", :from => "Designation")
  fill_in("Phone", :with => "1234")
end

Then (/^I should see a warning "(.*?)"$/) do |thisb|
  page.should have_content(thisb)
end