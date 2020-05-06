Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  resources :tasks, only: [:index, :new, :create, :edit, :update]
  root "top#index"
end
