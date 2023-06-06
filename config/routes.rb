Rails.application.routes.draw do
  root to: 'boards#index'

  resources :boards, only: [:show, :new, :create, :edit, :update]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
