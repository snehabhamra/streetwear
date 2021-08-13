Rails.application.routes.draw do
  resources :products, only: [:show, :new, :destroy, :create, :update, :index, :edit] 
  resources :pictures
  root to: 'store#index' 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users/sign_out',  to: 'devise/sessions#destroy'
  get '/users/sign_out' => :destroy, to: 'sessions#new'
end




