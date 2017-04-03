Rails.application.routes.draw do
  root 'questions#index'

  devise_for :users

  resources :questions, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
    resources :answers, only: [:create]
  end

  resources :answers, only: [:show] do
    resources :comments, only: [:create]
  end
end
