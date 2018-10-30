Rails.application.routes.draw do
  devise_for :users
  root 'titles#index'
  get 'titles' => 'titles#index'
  resources :users, only: [:edit, :update]
  #resources :odais
  resources :odais do
    resources :bokes
  end

  scope :bokes do
    get "/hot" => "bokes#hot"
  end

end
