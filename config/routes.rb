Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :reviews
  resources :users
  resources :baby_products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
