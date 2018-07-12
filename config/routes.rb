Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show]
  resources :users do
    resources :collaborators, only: [:new, :create, :destroy]
  end
 
  resources :wikis do
    resources :collaborators
  end
  
  resources :charges, only: [:new, :create]

  match 'users/:id' => 'users#show', via: :get
  # match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]
  
  get 'welcome/index'
  get 'users/show'

  root 'welcome#index'

  authenticated :user do
    root 'wikis#index', as: :authenticated_user
  end
end