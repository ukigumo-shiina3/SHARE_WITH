Rails.application.routes.draw do
  devise_for :users
  get 'messages/create'
  get 'messages/destroy'
  get 'rooms/create'
  get 'rooms/show'
  get 'genres/index'
  get 'favorites/destroy'
  get 'favorites/create'
  get 'comments/create'
  get 'comments/destroy'
  get 'events/index'
  get 'events/create'
  get 'events/edit'
  get 'events/update'
  get 'events/destroy'
  get 'homes/index'
  get 'homes/about'
  get 'homes/howto'
  get 'users/index'
  get 'users/edit'
  get 'users/show'
  get 'users/update'
  get 'users/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
