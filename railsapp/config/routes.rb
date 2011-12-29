Website::Application.routes.draw do
  # ActiveAdmin stuff
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
end
