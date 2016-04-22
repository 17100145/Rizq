And (/^I generate a request$/) do
    # page.should have_content("Donate Food")
    # click_link("Donate Food")
    click_link("/rizqs/new")
    fill_in("Food", :with => "Some Food")
    fill_in("Quantity", :with => "4")
    fill_in("Area", :with => "DHA")
    fill_in("Quantity", :with => "4")
    select_date("25-Nov-2011", :from => "Date")
    select_time("12:50", :from => "Time")
    check("Perishable")
    click_button("Submit")
end

And (/^a receiver generates a request$/) do
    @user = User.create(username: "somere", email: "somere@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "user", firstname: "Ben", lastname: "Ten", phone: 8364)
    Rizq.create!(user_id: @user.id, action: "Request", food: "Yummy", quantity: "10", address: "LUMS", area: "DHA", date: "25-Nov-2011", time: "12:50", perishable: true) 
end

Then (/^I should see the request on my profile$/) do
    page.should have_content("Yummy")
    page.should have_content("DHA")
end

And (/^I should be able to delete the request$/) do
    # @req = Rizq.find_by food: 'Yummy'
    click_on("delete")
    @req2 = Rizq.find_by food: 'Yummy'
    if (@req2 != nil)
        fail(ArgumentError.new('Assertion failed'))
    end
end

Given (/^there exists a volunteer "(.*?)"$/) do |in_vol|
    @user = User.create(username: in_vol, email: "somevol@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "volunteer", firstname: "Ben", lastname: "Ten", phone: 8364, approval: true)
end

Then (/^I should be able to assign "(.*?)" to the request$/) do |in_vol|
    select(in_vol)
    click_on("assign")
    @req2 = Rizq.find_by food: 'Yummy'
    if (@req2.volunteer != "Vol")
        fail(ArgumentError.new('Assertion failed'))
    end
end