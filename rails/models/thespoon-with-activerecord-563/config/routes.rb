Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # VERB + URL/PATH + CONTROLLER#ACTION

  # get 'restaurants', to: 'restaurants#index'

  # get 'restaurants/new', to: 'restaurants#new', as: :new_restaurant # new route is for our new form view
  # post 'restaurants', to: 'restaurants#create'

  # get 'restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  # patch 'restaurants/:id', to: 'restaurants#update'

  # get 'restaurants/:id', to: 'restaurants#show', as: :restaurant

  # delete 'restaurants/:id', to: 'restaurants#destroy'

  resources :restaurants # => creates all CRUD routes for us
end
