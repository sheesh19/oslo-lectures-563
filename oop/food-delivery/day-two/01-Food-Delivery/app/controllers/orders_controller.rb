require 'pry'
require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/sessions_view'

require_relative '../repositories/base_repository'
require_relative '../repositories/order_repository'
require_relative '../repositories/meal_repository'
require_relative '../repositories/customer_repository'
require_relative '../repositories/employee_repository'

class OrdersController

  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @orders_view.display(undelivered_orders)
  end

  def add
    # create all of our instances
    meal = select_meal
    customer = select_customer
    employee = select_employee

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.add(order)
  end

  def list_my_orders(current_user)
    my_undelivered_orders(current_user)
  end

  def mark_as_delivered(current_user)
    my_orders = my_undelivered_orders(current_user)
    order_id = @orders_view.ask_for('completed order id').to_i
    order = my_orders.find { |order| order.id == order_id }
    @order_repository.mark_as_delivered(order)
    my_undelivered_orders(current_user)
  end

  private

  def select_meal
    meals = @meal_repository.all
    @meals_view.display(meals)
    meal_id = @meals_view.ask_for('meal id').to_i
    # from our meals array, return the one the user asks for
    @meal_repository.find(meal_id)
  end

  def select_customer
    customers = @customer_repository.all
    @customers_view.display(customers)
    customer_id = @customers_view.ask_for('customer id').to_i
    @customer_repository.find(customer_id)
  end

  def select_employee
    employees = @employee_repository.all_delivery_guys
    @sessions_view.display(employees)
    employee_id = @sessions_view.ask_for('employee id').to_i
    # from our meals array, return the one the user asks for
    @employee_repository.find(employee_id)
  end

  def my_undelivered_orders(current_user)
    # with logged in user, return all undelivered orders
    undelivered_orders = @order_repository.my_undelivered_orders(current_user)
    @orders_view.display(undelivered_orders)
  end
end












