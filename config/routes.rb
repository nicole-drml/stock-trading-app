Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
  end

  get 'home/index'
  root 'home#index' 

  authenticated :user, ->(user) {user.admin? } do
    resources :stocks
    
    scope "/admin" do
      resources :users
    end
    get '/admin/dashboard' => 'users#dashboard' 
    get '/admin/users' => 'users#index', as: 'admin/active_users' 
    get '/admin/pending_users' => 'users#pending_users' 
    post 'admin/users' => 'users#create', as: 'admin_create_user'
    get 'admin/edit/user/:id' => 'users#edit', as: 'edit_selected_user'
  end
end

