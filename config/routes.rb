Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:new, :create, :show] do
    member do
      get 'setting'
    end
  end

  get "/login", to: "sessions#new", as: :new_session
  post "/login", to: "sessions#create", as: :sessions
  delete "/logout", to: "sessions#destroy", as: :logout

  resources :posts do
    resources :comments
  end

  root "posts#index"
end

