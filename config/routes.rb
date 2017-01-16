Rails.application.routes.draw do
  resources :reservations
  resources :rooms
  resources :types
  resources :builds
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
