# require "spec_helper"


# describe UsersController do
#     before :each do
#     DatabaseCleaner.clean
#     @user = FactoryGirl.create(:user)
#     logged_in_user @user              
#     end
#     context 'when #user is valid'
#         it 'renders a single user' do
#         get :show, id: @user._id
#         response.should render_template :show
#         end
#     end
    
#     describe 'POST create' do
#         let(:user) { mock_model(User, params) }
# 		User.should_receive(:new).with(@params).and_return(@user)
# 	end
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

# end