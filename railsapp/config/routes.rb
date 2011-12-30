Website::Application.routes.draw do
  resources :authors

  resources :posts, only: [ :index, :show ]

  # ActiveAdmin stuff
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
end
