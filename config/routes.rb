Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'home/index'
  get 'home/faqs'
  get 'home/contact'
  get 'auth/login'
  get 'auth/logout'
  get 'auth/register'
  get 'auth/profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # rails g devise:views
end
