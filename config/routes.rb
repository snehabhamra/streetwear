Rails.application.routes.draw do
  resources :products, only: [:show, :new, :destroy, :create, :update, :index, :edit, :delete] 
  resources :pictures
  root to: 'store#index' 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users/sign_out',  to: 'devise/sessions#destroy'
  get '/users/sign_out' => :destroy, to: 'sessions#new'
  get 'products/index' => :destroy, to: 'products#index'
  get "/products", to: "products#index"
  post "/products", to: "products#create"
  get "/products/new", to: "products#new"
  get "/products/:id/edit", to: "products#edit"
  put "/products/:id", to: "products#update"
  patch "/products/:id", to: "products#update"
  get "/products/:id", to: "products#show"
  delete "/products/:id", to: "products#destroy"
end




