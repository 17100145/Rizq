# spec/controllers/rizqs_controller_spec.rb

describe RizqsController do
    before :each do
    DatabaseCleaner.clean
    @rizq = FactoryGirl.create(:rizq)
    end
    describe '#index' do
    end
    
    describe 'GET #new' do
        it 'creates a new object' do
            @rizq.should be_an_instance_of Rizq
            user = User.create(username: 'abc12345', email: 'somer@gmail.com', password: 'somepass', password_confirmation: 'somepass', cnic: 1234, designation: 'user')
            get :new, session: { user_id: user.id }
        end
    end
    
    describe '#destroy' do 
    end
    
    describe 'POST #create' do
        context 'it creates a RIZQ request' do
            it 'redirects to home page when not logged in' do
                user = User.create(username: 'abc12345', email: 'somer@gmail.com', password: 'somepass', password_confirmation: 'somepass', cnic: 1234, designation: 'user')
                @rizq.should be_an_instance_of Rizq
                post :create, session: { user_id: user.id }
                expect(response).to redirect_to root_url
            end
            it 'creates a new Rizq object succesfully' do
                user = User.create(username: 'abc12345', email: 'somer@gmail.com', password: 'somepass', password_confirmation: 'somepass', cnic: 1234, designation: 'user')
                @rizq.should be_an_instance_of Rizq
                post :create, session: { user_id: user.id }
                expect(response).to redirect_to root_url
            end
        end
    end
    
    describe '#edit' do
    end
    
    describe '#update' do
    end
    
    describe '#show' do 
    end
    
    describe '#about' do
    end
    
    describe '#faqs' do
    end
    
    describe '#contactus' do
    end
    
    describe '#ourteam' do
    end
    
    
end