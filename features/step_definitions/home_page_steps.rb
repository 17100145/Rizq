Given(/^there's a manager named "(.*?)" and he posts "(.*?)"$/) do |userin, status|
#   @post = FactoryGirl.create(:post, userid: 1, status: status)
    @user = User.create(username: userin, email: "someuser@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "manager", firstname: userin, lastname: "Ten", phone: 8364)
    Post.create!(user_id: @user.id, status: status)
end

When(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the "(.*?)" post$/) do |status|
  page.should have_content(status)
end

Given(/^there's a user named "(.*?)", who is not a manager, and he posts "(.*?)"$/) do |userin, status|
#   @post = FactoryGirl.create(:post, userid: 1, status: status)
    @user = User.create(username: userin, email: "someuser@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "volunteer", firstname: userin, lastname: "Ten", phone: 8364)
    Post.create!(user_id: @user.id, status: status)
end

Then(/^I should not see the "(.*?)" post$/) do |status|
  page.should_not have_content(status)
end

And (/^I enter post "(.*?)"$/) do |status|
  fill_in "post_status", with: status
end