Rails.application.routes.draw do
  resources :reservations, only: [:index, :new, :create]
  resources :rooms, only: [:index, :show, :new, :create] do
    post :confirm, on: :collection
  end
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    get :account, on: :collection
  end
  root 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
