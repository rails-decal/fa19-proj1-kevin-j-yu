Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  patch 'capture', action: :capture, controller: 'pokemons'
  patch 'damage', action: :damage, controller: 'pokemons'
end
