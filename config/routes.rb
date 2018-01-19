Rails.application.routes.draw do

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :charges
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products
	root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
