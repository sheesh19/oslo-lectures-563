# ACTIVE RECORD? => design pattern, we can create records in our database that relate to an instance in our code
# == we can write ruby code to interact with our database

# RAKE TASKS
# - rake db:drop
# - rake db:create
# - rake db:migrate
# - rake db:timestamp
# - rake db:seed
# - rake console => irb + environment

class Restaurant < ActiveRecord::Base
end

# CRUD ACTIONS

# ACTIVE RECORD CRUD

# CREATE
restaurant = Restaurant.new(name: 'Pita Pockit', ...)
restaurant.save

Restaurant.create(name: 'Pita Pockit', ...)

# READ ALL
Restaurant.all
Restaurant.where(manager: 'Sheila')

# READ ONE
restaurant = Restaurant.find(1)
restaurant = Restaurant.find_by(name: 'Hutong')

# DELETE
restaurant = Restaurant.find(1)
restaurant.destroy

# ADVANCED
Restaurant.count


