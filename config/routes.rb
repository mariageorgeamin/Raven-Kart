Rails.application.routes.draw do
  devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)
  devise_for :users
  get 'template/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'template/single'

  root to: 'template#index'
end
