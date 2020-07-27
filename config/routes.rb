# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  resource :users
  devise_for :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
