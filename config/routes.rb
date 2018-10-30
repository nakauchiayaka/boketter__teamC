Rails.application.routes.draw do
  devise_for :users
  root 'titles#index'
  get 'titles' => 'titles#index'
  put '/users/password_upadate',  to: 'users#password_update'
  resources :users, only: [:edit, :update]

  get '/my',                to: 'accounts#my'
  get '/account',           to: 'accounts#edit'
  get '/account/photo',     to: 'accounts#photo'
  get '/account/password',  to: 'accounts#password'
  get '/account/email',     to: 'accounts#email'
  get '/account/delete',    to: 'accounts#delete'
  get '/mute',              to: 'accounts#mute'
  
  resources :odais

end
