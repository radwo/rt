Rails.application.routes.draw do
  namespace :admin do
    resources :tasks
  end

  resources :tasks, only: [:index, :show] do
    resources :attempts, only: [:new, :create, :show]
  end
end
