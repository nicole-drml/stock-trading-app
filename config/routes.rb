Rails.application.routes.draw do
  devise_for :users
  
  get 'home/index'
  root 'home#index' 

  authenticated :user, ->(user) {user.admin? } do
    get '/admin' => 'admin#index' 
    post 'admin/create' => 'users#create'
    get 'admin/edit/user/:id' => 'users#edit', as: 'edit_selected_user'
  end
end
