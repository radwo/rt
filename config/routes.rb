Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :admin do
    resources :tasks
  end

  resources :tasks, only: [:index, :show] do
    resources :attempts, only: [:new, :create, :show]
  end

  root to: "tasks#index"
  get "admin", to: "admin/tasks#index"
end
