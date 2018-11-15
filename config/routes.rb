Rails.application.routes.draw do
  devise_for :users
  root 'titles#index'
  put '/users/password_upadate',  to: 'users#password_update'
  resources :users, except: [:index, :new, :create] do
    member do
      get 'boke'
      get 'odai'
      get 'favorites'
      get 'ratings1'
      get 'ratings2'
      get 'ratings3'
    end
  end

  resources :bokes, only: [:index] do
    resources :comments, only: [:create, :show, :update]
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
    resources :bokes,only: [:new, :create, :edit, :update]
    collection do
      get 'jinbutsu'
      get 'jinbutsu2ri'
      get 'animal'
      get 'scenery'
      get 'inorganicmatter'
      get 'illustration'
      get 'other'
      get 'search'
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

end
