Rails.application.routes.draw do
  devise_for :users
  root 'titles#index'
  put '/users/password_upadate',  to: 'users#password_update'
  resources :users, except: [:index, :new, :create] do
    member do
      get 'boke'
      get 'odai'
      get 'ratings1'
      get 'ratings2'
      get 'ratings3'
    end
  end




  get '/my',                to: 'accounts#my'
  get '/account',           to: 'accounts#edit'
  get '/account/photo',     to: 'accounts#photo'
  get '/account/password',  to: 'accounts#password'
  get '/account/email',     to: 'accounts#email'
  get '/account/delete',    to: 'accounts#delete'
  get '/mute',              to: 'accounts#mute'

  resources :titles do
    collection do
     get 'notlogin'
    end
  end

  resources :bokes do
      resources :stars ,only: [:create, :destroy]
      collection do
      get 'baka'
      get 'surreal'
      get 'ogeretu'
      get 'black'
      get 'relative'
      get 'example'
      get 'other'
      end
  end

  resources :odais do
    resources :bokes,only: [:new, :create]
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

  resources :legends , only: [:index] do
    collection do
      get 'baka'
      get 'surreal'
      get 'ogeretu'
      get 'black'
      get 'relative'
      get 'example'
      get 'other'
    end
  end


  # get '/user/:id/',           to: 'user#show'
  # get '/user/:id/boke',       to: 'user#boke'
  # get '/user/:id/odai',       to: 'user#odai'
  get '/user/:id/favorites',  to: 'user#favorites'
  get '/user/:id/ratings1',    to: 'user#ratings1'
  get '/user/:id/ratings2',    to: 'user#ratings2'
  get '/user/:id/ratings3',    to: 'user#ratings3'

end
