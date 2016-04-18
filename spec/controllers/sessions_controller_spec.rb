
# spec/controllers/sessions_controller_spec.rb


describe SessionsController do
  describe 'POST #create' do
    context 'when password is invalid' do
      it 'renders page with error' do
        user = create(:user)
        post :create, session: { email: user.email, password: 'invalid' }
        expect(response).to render_template(:new)
        expect(flash[:danger]).to match(/^Invalid email and password combination/)
      end
    end
  
    context 'when password is valid' do
      it 'displays the active user' do
        user = create(:user)
        post :create, session: { email: user.email, password: user.password }
        expect(response).to redirect_to user
      end
    end
  end
  describe 'GET #destroy' do
    context 'when Logout is pressed' do
      it 'logs out user session' do
        user = create(:user)
        get :destroy, session: { email: user.email, password: user.password }
        expect(response).to redirect_to root_url
      end
    end
  end
end