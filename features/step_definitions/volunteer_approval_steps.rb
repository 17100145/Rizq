Given (/^there is a volunteer request$/) do
    @user = User.create(username: "somevol", email: "somevol@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "volunteer", firstname: "Ben", lastname: "Ten", phone: 8364)
end

And (/^I'm logged in as a "(.*?)"$/) do |status|
    @user = User.create(username: "someuser", email: "someuser@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "manager", firstname: "Ben", lastname: "Ten", phone: 8364)
    visit '/login'
    fill_in("Email", :with => "someuser@gmail.com")
    fill_in("Password", :with => "some_p")
    click_button("Log in")
end

When (/^I am on my profile$/) do

end

Then (/^I should see volunteer details under "(.*?)"$/) do |in_field|
    page.should have_content(in_field)
    @user = User.find_by_username("somevol")
    page.should have_content(@user.username)
    page.should have_content(@user.email)
end

And (/^Then the volunteer should be approved$/) do
    @user = User.find_by_username("somevol")
    assert(@user.approval, true)
end
