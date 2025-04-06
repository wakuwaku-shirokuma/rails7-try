Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root "hello#index"
end
