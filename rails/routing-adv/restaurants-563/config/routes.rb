Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # collection
  # member
  # resources :restaurants

  resources :restaurants do
    collection do
      get :top # /restaurants/top
    end

    member do
      get :chef # /restaurants/:id/chef
    end

    resources :reviews, only: [ :new, :create ] # /restaurants/:restaurant_id/reviews/...
  end

  resources :reviews, only: [ :destroy ]

  # REVIEW: route for index for restaurant model
  # get 'restaurants', to: 'restaurants#index'

  # REVIEW: route for show for restaurant model
  # get 'restaurants/:id', to: 'restaurants#show'
end
