Rails.application.routes.draw do
  namespace :admin do
    resources :tasks
  end
end
