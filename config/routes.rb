Website::Application.routes.draw do
  # ActiveAdmin stuff
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :posts,   only: [ :index, :show ]
  resources :preview, only: [ :index, :show ]
  root :to => 'posts#index'
end
