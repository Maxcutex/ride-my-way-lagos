Rails.application.routes.draw do
  resources :faqs
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "home#index"
  get 'home/index'
  get 'home/faqs', to: 'home#faqs', as: 'home_faqs'
  get 'home/faqs/:id', to: 'home#faq_show', as: 'home_faq_show'
  get 'home/contact'
  get 'rides/:ride_id/followers/:id/unsubscribe', to: 'followers#unsubscribe', as: 'unsubscribe'
  patch 'rides/:ride_id/followers/:id/remove', to: 'followers#remove', as: 'remove'
  get 'rides/:user_id/created', to: 'rides#created_rides', as: 'created_rides'
  get 'rides/:user_id/subscribed', to: 'rides#subscribed_rides', as: 'subscribed_rides'
  get 'rides/:id/complete_ride', to:  'rides#complete_ride', as: 'complete_ride'
  get 'rides/find', to: 'rides#find', as: 'find_ride'

  resources :rides do
    resources :followers
  end
  
  post 'rides/search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # rails g devise:views
end
