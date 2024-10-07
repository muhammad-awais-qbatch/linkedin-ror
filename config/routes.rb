Rails.application.routes.draw do
  # resources :posts
  # resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  scope path_names: { new: 'make' } do
  # resources :articles
    resources :posts
    # rest of your routes
  end
  # resources :posts, path_names: { new: 'make', edit: 'change' }
  root "users#index"

  get "/signup", to: "signup#new"
  post "/signup", to: "signup#create"

  get "/users", to: "users#index"
  # get "/users", to: "signup#index"


  get "login", to: "login#new"
  post "login", to: "login#validate"
  delete "login", to: "login#delete"

  post "/connections/:id", to: "connections#create"
  post "/connections/accept/:id", to: "connections#accept"
  get "/connections", to: "connections#index"

  get "skills/all", to: "skills#index"
  get "skills", to: "skills#new"
  post "skills", to: "skills#create"

  get "/connections/:id", to: "connections#show"

  post "endorsements/:id", to: "endorsements#create"

  # get "user_skills/index"
  # get "skills/index"
  # get "users/index"
end