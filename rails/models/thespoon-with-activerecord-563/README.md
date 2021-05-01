# README

- RECAP

- TESTING
rails c
raise
rails s

- COMMANDS
rails db:drop
rails db:create
rails db:migrate
rails db:seed


- VERB URL, to: CONTROLLER#ACTION

get "restaurants", to: "restaurants#index"

get "restaurants/new", to: "restaurants#new", as: :new_restaurant => GETS US THE FORM
post "restaurants", to: "restaurants#create"

get "restaurants/:id", to: "restaurants#show", as: :restaurant


get "restaurants/:id/edit", to: "restaurants#edit" => GETS US THE FORM
patch "restaurants/:id", to: "restaurants#update"

delete "restaurants/:id", to: "restaurants#destroy"


resources :restaurants
