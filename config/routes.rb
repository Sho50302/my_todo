Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  resources :tasks
  resources :users, only: [:show]
  resources :groups, only: [:new, :create, :edit, :update]
  root "tasks#index"
end
