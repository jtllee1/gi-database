Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :characters, only: [:index, :show]
  resources :teams, only: [:index, :new, :create, :destroy] do
    resources :slot_1, only: [:new, :create, :destroy]
    resources :slot_2, only: [:new, :create, :destroy]
    resources :slot_3, only: [:new, :create, :destroy]
    resources :slot_4, only: [:new, :create, :destroy]
  end
end
