Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  unauthenticated(:user) do
    root to: "pages#landing", as: :landing
  end

  authenticated(:user) do
    root to: "games#index"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")



  resources :pages, only: [:index]
  get '/profile', to: 'pages#profile', as: 'profile'

  resources :questions, only: [:show]
  resources :answers, only: [:show]
  resources :responses, only: [:create]
  resources :games, only: [:index, :show] do
    member do
      get :score
    end
  end
end
