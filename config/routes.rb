Rails.application.routes.draw do
  devise_for :users
  root 'events#index'  
  get 'home/about'
  get 'home/howto'
  post '/events/guest_sign_in', to: 'events#new_guest'

  resources :users, only: [:index, :edit, :show, :update,:destroy] 
  resources :events do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :genres, only: [:index]
  resources :rooms, only: [:create, :show]
  resources :messages, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
