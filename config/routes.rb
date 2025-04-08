Rails.application.routes.draw do
  resources :companies
  devise_for :users
  resources :posts
  root "hello#index"
end
