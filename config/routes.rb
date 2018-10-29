Rails.application.routes.draw do
  devise_for :users
  root 'titles#index'
  get 'titles' => 'titles#index'
  resources :users, only: [:edit, :update]
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
