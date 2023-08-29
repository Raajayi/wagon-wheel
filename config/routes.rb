Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :questions, only: [:show]
  resources :answers, only: [:show]
  resources :responses, only: [:create]
  resources :games, only: [:index, :show] do
    member do
      get :score
    end
  end
end
