require "spec_helper"

describe UsersController do
    before :each do
        DatabaseCleaner.clean
        @user = FactoryGirl.create(:user)
    end
    # context 'when #user is valid'
    #     it 'renders a single user' do
    #     get :show, id: @user._id
    #     response.should render_template :show
    #     end
    # end
    
    
    describe 'GET #new' do
        it 'creates a User object' do
            get :new
            # @user.should be_an_instance_of User
            # expect(response).to redirect_to new_user_path
        end
    end
    
    describe 'POST #create' do
        before(:each) do
            # @user = mock(:user, :save => true)
            # Job.stub!(:new).and_return(@user)
        end
        it 'creates a user when valid parameters are passed' do
            @user_params = {"username" => "Abeera", "email" => "abeera@gmail.com", "password" => "abcd1234", "password_confirmation" => "abcd1234", "cnic" => 35202, "age" => 12, "address" => "LUMS", "organization" => "Also LUMS", "designation" => "manager", "firstname" => "Abeera", "lastname" => "Shamail", "phone" => 12345}
            post :create, {:user => @user_params}
            expect(flash[:success]).to match(/^Welcome!/)
        end
        it 'does not create a user when invalid params' do
            @user_params =  {"username" => "Abeera", "email" => "abeera@gmail.com", "password" => "abcd12345", "password_confirmation" => "abcd1234", "cnic" => 35202, "age" => 12, "address" => "LUMS", "organization" => "Also LUMS", "designation" => "manager", "firstname" => "Abeera", "lastname" => "Shamail", "phone" => 12345}
            post :create, {:user => @user_params}
        end
        # context '??' do
        #     it 'lets the user log in' do
        #         post :create, user: {username: @user.username, email: 'gimmeFood@gmail.com', password: 'gimme', firstname: @user.firstname, lastname: @user.lastname}
        #         expect(flash[:success]).to match(/^Welcome!/)
        #         expect(response).to redirect_to @user
        #     end
        # end
        
        # context '??' do
        #     it 'reloads the page?' do
        #          post :create, user: {username: @user.username, email: @user.email, password: @user.password, firstname: @user.firstname, lastname: @user.lastname}
        #          expect(response).to render_template('new')
        #     end
        # end
    end
    
    # describe 'GET #activate' do
    #     it 'approves a volunteer' do
    #         # expect(get("activate")).to route_to("users/#{@user.id}/activate")
    #         get :activate, "active_user"
    #         expect(response).to redirect_to user_path(@user)
    #     end
    # end
    
    # describe 'GET #reject' do
    #     it 'rejects a vounteer' do
    #         get :reject, "users/#{@user.id}/activate"
    #         expect(response).to redirect_to user_path(@user)
    #     end
    # end    
    describe '#user_params' do
        it 'validates user parameters??' do
        end
    end
    
    describe '#user_update_params' do
    end
    
    describe '#logged_in_user' do
    end
    
    describe '#correct_user' do
    end
    
    describe 'GET #edit' do
        it 'tries to edit user' do
            # get :edit, :id => 1234
            @user1 = User.create(username: "Abeera", email: "abeera@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "manager", firstname: "Abeera", lastname: "Shamail", phone: 8364)
            session[:user_id] = @user1.id
            get :edit, :id => @user1.id
        end
    end
    
    describe 'PUT #update' do
        it 'updates user info' do
            @user1 = User.create(username: "Abeera", email: "abeera@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "manager", firstname: "Abeera", lastname: "Shamail", phone: 8364)
            @user_update_params = {"email" => "abeera1@gmail.com", "password" => "abcd1234", "password_confirmation" => "abcd1234", "cnic" => 35202, "age" => 12, "address" => "LUMS", "organization" => "Also LUMS", "designation" => "manager", "firstname" => "Abeera", "lastname" => "Shamail", "phone" => 12345}
            session[:user_id] = @user1.id
            put :update, :id => @user1.id, :user => @user_update_params
        end
    end
    
    describe 'GET #show' do
        it 'shows stufff' do
            @user1 = User.create(username: "Abeera", email: "abeera@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "manager", firstname: "Abeera", lastname: "Shamail", phone: 8364)
            session[:user_id] = @user1.id
            get :show, :id => @user1.id
        end
        
        it 'post stufff' do
            @user1 = User.create(username: "Abeera", email: "abeera@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "manager", firstname: "Abeera", lastname: "Shamail", phone: 8364)
            session[:user_id] = @user1.id
            get :show, :id => @user1.id, :post => {status: "bleh"}
        end
        
        it 'post stufff' do
            @user1 = User.create(username: "Abeera", email: "abeera@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "manager", firstname: "Abeera", lastname: "Shamail", phone: 8364)
            session[:user_id] = @user1.id
            get :show, :id => @user1.id, :post => {status: ""}
        end
        
        it 'we have a volunteer' do
            @user1 = User.create(username: "Abeera", email: "abeera@gmail.com", password: "some_p", password_confirmation: "some_p", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "manager", firstname: "Abeera", lastname: "Shamail", phone: 8364)
            @user2 = User.create(username: "AbeeraV", email: "abeerav@gmail.com", password: "some_pv", password_confirmation: "some_pv", cnic: 923344, age: 23, address: "addresss", organization: "org", designation: "volunteer", firstname: "Abeerav", lastname: "Shamailv", phone: 8364)
            @rizq1 = Rizq.create(user_id: @user1.id, action: "Request", food: "Yummy", quantity: "10", address: "LUMS", area: "DHA", date: "25-Nov-2011", time: "12:50", perishable: true) 

            session[:user_id] = @user1.id
            get :show, :id => @user1.id, :usern => {useri: @user2.id}, :rizq_id => @rizq1.id
        end
    end

    

end
# 	def do_post
# 		post :create, :user => @params
# 	end
# 	it "calls user model with param values" do
# 		do_post
# 	end
	
# 	it "should redirect_to albums_path" do
# 		@user.should_receive(:save).and_return true
# 		do_post
# 		response.should redirect_to(albums_path)
# 	end
	
# 	it "should render new if failed" do
# 		@user.should_receive(:save).and_return false
# 		do_post
# 		response.should render_template('new')
# 	end

# end