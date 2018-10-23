Rails.application.routes.draw do
  root 'titles#index'
  get 'titles' => 'titles#index'
  resources :odais
end
