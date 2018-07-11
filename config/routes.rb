=begin
Rails.application.routes.draw do
  
  devise_for :users
  resources :users
  resources :users do
    resources :collaborators, only: [:create, :destroy]
  end

  resoures :wikis
  resources :charges, only: [:new, :create]
  

  match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]
  
  get 'welcome/index'
  get 'users/show'

  root 'welcome#index'
end
=end
Rails.application.routes.draw do

  get 'users/show'
  get 'welcome/index'
  resources :wikis 

  devise_for :users
  match 'users/:id' => 'users#show', via: :get
  resources :user, only: [:show]
  resources :users do
    resources :collaborators, only: [:create, :destroy]
  end

  # Stripe payment SubscriptionsController
  resource :subscription
  resource :card
  
  get 'downgrade_account' => 'subscription#downgrade_account'
  post 'stripe_checkout' => 'subscriptions#stripe_checkout'

  get 'about' => 'welcome#about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_user
  end

  root 'welcome#index'

end