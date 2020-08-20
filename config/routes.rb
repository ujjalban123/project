Rails.application.routes.draw do
  
 
  resources :devises
  devise_for :users
  
  root to: 'pages#home'
 
  devise_scope :user do
    get 'login', to:'devise/sessions#new'
  end   

  
   
  get '/home', to: 'pages#home'
  resources :pages 

  get '/upload', to: 'images#new'
  resources :images, only: [:index, :show, :create]

  get '/@:username', to: 'users#show', as: :profile

  get '/user', to: 'users#edit'
  resources :users

  resources :videos
 
 resources :users do
  member do
    get :follow
    get :unfollow
  end
end

get'search',to: 'users#search'

resources :images do
  member do
    put "like" => "images#like"
  end
end

resources :videos do
  member do
    put "like" => "videos#like"
  end
end

 
end
