require 'rails_helper'

describe UsersController, type: :controller do

  before do
    @user = User.create!(email: 'joeschmoe@fake.com', password: 'joeschmoe')
    @user2 = User.create!(email: 'janeschmoe@fake.com', password: 'janeschmoe')
  end

  describe 'GET #show' do
    context 'user is logged in' do
      before do
        sign_in @user
      end

      it 'loads correct user details' do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status(302)
        expect(assigns(:user)).to eq @user
      end
    end

    context 'no user is logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(new_user_session_path)
    end
  end

    context 'user cannot see other user page' do
      before do
        sign_in @user2
      end
      it 'redirect to root path' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
