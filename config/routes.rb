Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, controllers: { registrations: "user_registrations" }

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/landing_page'

  get 'static_pages/thank_you'

  root 'static_pages#index'

  post 'static_pages/thank_you'

  resources :orders, only: [:index, :show, :create, :destroy]

  resources :products do
    resources :comments
  end
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
