Rails.application.routes.draw do
  root 'questions#index'

  devise_for :users

  resources :questions, only: [:index, :show, :new, :create] do
    resources :votes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :answers, only: [:create] do
    resources :votes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
end
