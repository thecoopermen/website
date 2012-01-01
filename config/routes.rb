Website::Application.routes.draw do
  resources :posts, only: [ :index, :show ]

  # ActiveAdmin stuff
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'posts#index'
end
