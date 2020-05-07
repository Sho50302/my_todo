Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  resources :tasks, only: [:index, :new, :create, :edit, :update]
  resources :users, only: :show
  resources :groups, only: [:new, :create]
  root "top#index"
end
