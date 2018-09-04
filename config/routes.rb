Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "home#index"
  get 'home/index'
  get 'home/faqs'
  get 'home/contact'
  get 'rides/:ride_id/followers/:id/unsubscribe', to:  'followers#unsubscribe', as: 'unsubscribe'
  get 'rides/:user_id/created', to:  'rides#created_rides', as: 'created_rides'
  get 'rides/:user_id/subscrided', to:  'rides#subscribed_rides', as: 'subscribed_rides'
  get 'rides/:ride_id/complete_ride', to:  'rides#complete', as: 'complete_ride'

  resources :rides do
    resources :followers
  end 
  post 'rides/search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # rails g devise:views
end
