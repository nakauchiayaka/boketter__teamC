Rails.application.routes.draw do
  devise_for :users
  root 'titles#index'
  get 'titles' => 'titles#index'
  resources :users, only: [:edit, :update]

  get '/account', to: 'accounts#edit'
  get '/account/photo', to: 'accounts#photo'
  get '/account/password', to: 'accounts#password'
  get '/account/email', to: 'accounts#email'
  get '/account/delete', to: 'accounts#delete'
end
