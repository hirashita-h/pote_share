Rails.application.routes.draw do
  resources :reservations, only: [:index, :new, :create] do
    post :confirm, on: :member
  end
  resources :rooms, only: [:index, :show, :new, :create]
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    get :account, on: :collection
  end
  root "homes#top"
end
