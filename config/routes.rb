Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  get 'users/show'

  resources :tasks
  resources :users, only: :show
  resources :groups, only: [:new, :create, :edit, :update]
  root "top#index"
end
