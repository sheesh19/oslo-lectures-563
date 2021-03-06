class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    while @running
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.manager?
          route_manager_action
        else
          route_rider_action
        end
      end
      print `clear`
    end
  end

  def route_manager_action
    print_manager_menu
    choice = gets.chomp.to_i
    print `clear`
    manager_action(choice)
  end

  def route_rider_action
    print_rider_menu
    choice = gets.chomp.to_i
    print `clear`
    rider_action(choice)
  end

  def print_manager_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. List all meals"
    puts "2. Add new meal"
    puts "3. Edit meal"
    puts "4. Delete meal"
    puts "5. List all customers"
    puts "6. Add new customer"
    puts "7. Edit customer"
    puts "8. Delete customer"
    puts "9. List all undelivered orders"
    puts "10. Logout"
    puts "11. Exit"
    print "> "
  end

  def print_rider_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. List my undelivered orders"
    puts "2. Mark order as delivered"
    puts "3. Logout"
    puts "4. Exit"
    print "> "
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.destroy
    when 5 then @customers_controller.list
    when 6 then @customers_controller.add
    when 7 then @customers_controller.edit
    when 8 then @customers_controller.destroy
    when 9 then @orders_controller.list_undelivered_orders
    when 10 then logout!
    when 11 then stop!
    else puts "Invalid number! Try again..."
    end
  end

  def rider_action(choice)
    case choice
    when 1 then @orders_controller.list_my_orders(@current_user)
    when 2 then puts @orders_controller.mark_as_delivered(@current_user)
    when 3 then logout!
    when 4 then stop!
    else puts "Invalid number! Try again..."
    end
  end

  def logout!
    @current_user = nil
  end

  def stop!
    logout!
    @running = false
  end

end
