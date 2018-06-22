Rails.application.routes.draw do
  devise_for :users
  resources :wikis do
    resources :collaborators, only: [:new, :create]
  end
  resources :charges, only: [:new, :create]
  resources :users

  match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]
  
  get 'welcome/index'
  root 'welcome#index'
end