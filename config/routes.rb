Rails.application.routes.draw do
  root 'questions#index'

  resources :qeustions, only: [:index, :show, :new]
end
