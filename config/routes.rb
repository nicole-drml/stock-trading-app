Rails.application.routes.draw do
  devise_for :users
  
  get 'home/index'
  root 'home#index' 
  get '/dashboard' => 'dashboard#index', as: 'dashboard'
end
