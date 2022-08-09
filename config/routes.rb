Rails.application.routes.draw do
  resources :rooms, only: [:index, :show, :new, :create]
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  get 'users/account'
  root 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
