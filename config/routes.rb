Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  resources :movies, only: [:index, :show] do 
    get "search", on: :collection
    resources :reviews, only: [:index]
  end

  resources :reviews do 
    patch "like", on: :member
    patch "unlike", on: :member
    get "liked", on: :collection
  end

  get "account/user_id" => "accounts#show"

  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"

  namespace :admin do 
    root "top#index"
    resources :users do 
      get "search", on: :collection
    end
    resources :reviews 
    resources :movies do 
      resources :images, controller: "movie_images", only: [:index, :new, :edit]
    end
  end
  
end
