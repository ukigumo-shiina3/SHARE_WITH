Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root 'events#index'  
  get 'home/about', to: 'homes#about'
  get 'home/howto', to: 'homes#howto'
  post '/events/guest_sign_in', to: 'events#new_guest'
  get '/search' => 'search#search'

  resources :users, only: [:index, :edit, :show, :update,:destroy] 
  resources :events do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :genres, only: [:index]
  resources :rooms, only: [:create, :show, :index]
  resources :messages, only: [:create, :destroy]
  resources :schedule, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
