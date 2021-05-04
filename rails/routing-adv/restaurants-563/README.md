# README


## RECAP

> For our restaurants

   VERB | CONTROLLER ACTION | ACTIVE RECORD
1. GET => INDEX => .all
2. GET => SHOW => .find
3. GET => NEW => .new
4. POST => CREATE => .create
5. GET => EDIT => .find
6. PATCH => UPDATE => .update
7. DELETE => DESTROY => .destroy

resources :restaurants

VERB "URL", to: "controller#action"

1. get "restaurants", to: "restaurants#index"
2. in our restaurants controller, `def index; end`
3. views > restaurants > index.html.erb
