Rails.application.routes.draw do
  devise_for :users
  root 'titles#index'
  get 'titles' => 'titles#index'
  put '/users/password_upadate',  to: 'users#password_update'
  resources :users, only: [:edit, :update]

  #resources :odais
  resources :odais do
    resources :bokes
  end

  scope :bokes do
    get "/hot" => "bokes#hot"
  end


  get '/my',                to: 'accounts#my'
  get '/account',           to: 'accounts#edit'
  get '/account/photo',     to: 'accounts#photo'
  get '/account/password',  to: 'accounts#password'
  get '/account/email',     to: 'accounts#email'
  get '/account/delete',    to: 'accounts#delete'
  get '/mute',              to: 'accounts#mute'
  
  resources :odais do
    collection do
      get 'jinbutsu'
      get 'jinbutsu2ri'
      get 'animal'
      get 'scenery'
      get 'inorganicmatter'
      get 'illustration'
      get 'other'
    end
  end
  # namespace :odai do
  #   resources :popular do
  #     collection do
  #       get 'jinbutsu'
  #     end
  #   end
  # end
end
