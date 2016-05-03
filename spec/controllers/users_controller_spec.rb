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
            @user.should be_an_instance_of User
        end
    end
    
    describe 'POST #create' do
        # context 'creates a user' do
        #     let(:user) { mock_model(User, params) }
        #     it 'lets the user log in' do
    	   #     User.should_receive(:user).with(@params).and_return(@user)
    	   #     expect(flash[:success]).to match(/^Welcome!/)
    	   #     expect(response).to redirect_to @user
    	   # end
        # end
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
    
    describe '#edit' do
    end
    describe '#update' do
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