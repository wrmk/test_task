Rails.application.routes.draw do
  root 'user#index'
  devise_for :users
  post '/' => 'user#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
