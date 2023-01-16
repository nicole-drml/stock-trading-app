Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
    post 'create_user', to: 'users#create'
  end

  get 'home/index'
  root 'home#index' 


  authenticated :user, ->(user) {user.admin? } do

    scope "/admin" do
      resources :users
    end
    get '/admin' => 'admin#index' 
    post 'admin/create' => 'users#create'
    get 'admin/edit/user/:id' => 'users#edit', as: 'edit_selected_user'
  end
end
