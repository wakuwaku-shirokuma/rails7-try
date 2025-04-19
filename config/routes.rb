Rails.application.routes.draw do
  resources :companies
  devise_for :users
  root 'hello#index'

  namespace :auth do
    resource :salesforce, only: [:create], controller: 'salesforce' do
      collection do
        get 'callback'
      end
    end
  end
end
