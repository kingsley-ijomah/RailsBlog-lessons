Rails.application.routes.draw do

  root 'posts#index'

  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy'
  get '/contact' => 'messages#new'

  namespace :admin do 
    resources :moderators, only: [:edit, :update, :index] 
    resources :posts, :tags
    resources :comments, only: [:index, :destroy, :update]
    resources :visitors, only: [:index, :destroy]
    resources :messages, only: [:index, :update, :destroy, :show]
    resources :dashboard, only: [:index]
    resources :settings, only: [:new, :create, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
    resources :notifications, only: [:index, :destroy]
  end

  resources :posts, only: [:show, :index]
  resources :comments, only: [:create]
  resources :messages, only: [:new, :create]

  match 'dismiss_all_notifications', to: 'admin/notifications#delete_all', via: :delete
end