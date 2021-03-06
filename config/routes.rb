Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#google'

  get '/users_reviews' => 'reviews#user_reviews'
  
  resources :reviews

  resources :users do 
    resources :baby_products, only: [:new, :create, :index]
  end 

  resources :baby_products do 
    resources :reviews
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
