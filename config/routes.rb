Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  resources :tasks, only: [:index, :new, :create]
  root "top#index"
end
