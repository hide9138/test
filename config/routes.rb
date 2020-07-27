Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  get 'home/about' => 'home#about', as: 'about'
  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end