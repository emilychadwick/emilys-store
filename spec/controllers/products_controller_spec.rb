require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do

  context 'GET #index' do
    before do
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  context 'POST #create' do
    it 'is an invalid product' do
      @product = FactoryGirl.build(:product, name: "")
      expect(@product).not_to be_valid
    end
  end

  context 'PUT #update/:price' do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.build(:admin)
      sign_in @user
    end
  end

end