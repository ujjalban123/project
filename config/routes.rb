Rails.application.routes.draw do
  
  root to: 'pages#home'

  devise_for :users
   
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

post 'users/search' => 'users#search', as: 'search_users'

resources :images do
  member do
    put "like" => "images#like"
    put "dislike" => "images#dislike"
  end
end

resources :videos do
  member do
    put "like" => "videos#like"
    put "dislike" => "videos#dislike"
  end
end

 
end
