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
    
    describe 'DELETE #destroy' do 
        it "deletes the rizq session" do
            get :destroy, :id => @rizq
            expect(response).to redirect_to rizqs_url
            expect(flash[:notice]).to match(/^Rizq was successfully destroyed./)
        end
    end
    
    describe 'POST #create' do
        context 'when not logged in' do
            it 'redirects to home page' do
                user = User.create(username: 'abc12345', email: 'somer@gmail.com', password: 'somepass', password_confirmation: 'somepass', cnic: 1234, designation: 'user')
                @rizq.should be_an_instance_of Rizq
                post :create, session: { user_id: user.id }
                expect(response).to redirect_to root_url
            end
        end
        # context 'when logged in' do
        #     it 'creates a new Rizq object succesfully' do
        #         post :create, :id => @rizq, rizq: {user_id: @rizq.user_id, action: @rizq.action, food: @rizq.food, quantity: @rizq.quantity, address: @rizq.address, area: @rizq.area, date: @rizq.date, time: @rizq.time, perishable: @rizq.perishable}, session: {user_id: @rizq.user_id}
        #         expect(response).to redirect_to @rizq
        #         expect(flash[:notice]).to match(/^Rizq was successfully created./)
                
            #     user = User.create(username: 'abc12345', email: 'somer@gmail.com', password: 'somepass', password_confirmation: 'somepass', cnic: 1234, designation: 'user')
            #     @rizq_params = Rizq.create( user_id: user.id, action: 'Request', food: 'Yum', quantity: '12', address: 'abc12345', area: 'LUMS', date: '25-Nov-2011', time: '12:50', perishable: true)
            #     # @rizq1.should be_an_instance_of Rizq
            #     post :create, rizq1: Factory.attributes_for(:rizq)
            #     expect(response).to render_template(:new)
            #end
        #end
    end
    
    describe '#edit' do
    end
    
    describe '#update' do
        context 'given valid updates' do
            it 'updates rizq' do
                put :update, :id => @rizq, rizq: {user_id: @rizq.user_id, action: @rizq.action, food: @rizq.food, quantity: @rizq.quantity, address: @rizq.address, area: @rizq.area, date: @rizq.date, time: @rizq.time, perishable: @rizq.perishable}
                expect(response).to redirect_to @rizq
                expect(flash[:notice]).to match(/^Rizq was successfully updated./)
            end
        end
        # context 'given invalid updates' do
        #     it 'returns an error' do
        #         put :update, :id => @rizq, rizq: {user_id: @rizq.user_id, food: @rizq.food, quantity: @rizq.quantity, address: @rizq.address, area: @rizq.area}
        #         expect(response).to render_template(:edit)
        #     end
        # end
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