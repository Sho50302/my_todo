Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  root "tasks#index"
  resources :tasks do
    collection do
      get "user_new", to: "tasks#user_new"
      post "user_create", to: "tasks#user_create"
    end
    member do
      get "user_edit", to: "tasks#user_edit"
      patch "user_update", to: "tasks#user_update"
      get "user_show", to: "tasks#user_show"
      delete "user_destroy", to: "tasks#user_destroy"
    end
  end
  resources :users, only: :show
  resources :groups, only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :tasks
  end
end
