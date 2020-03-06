Rails.application.routes.draw do
  resources :authors
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
    resources :books do
    resources :reviews

    end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'books#index'
end