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

  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
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
    @order_repository.create(order)
  end

  def list_my_orders(current_user)
    my_undelivered_orders(current_user)
  end

  def mark_as_delivered(current_user)
    my_orders = my_undelivered_orders(current_user)
    order_index = @orders_view.ask_for('completed order id').to_i - 1
    # during livecode, we were using the id in our display view => in the updated spec you are using, they want you to use an index to display
    # order = my_orders.find { |order| order.id == order_id }

    order = my_orders[order_index]
    @order_repository.mark_as_delivered(order)
    my_undelivered_orders(current_user)
  end

  private

  def select_meal
    meals = @meal_repository.all
    @meals_view.display(meals)
    meal_index = @meals_view.ask_for('meal id').to_i - 1
    # during livecode, we were using the id in our display view => in the updated specs you are using, they want you to use an index to display

    # @meal_repository.find(meal_id)
    meals[meal_index]
  end

  def select_customer
    customers = @customer_repository.all
    @customers_view.display(customers)
    customer_index = @customers_view.ask_for('customer id').to_i - 1
    # @customer_repository.find(customer_id)
    customers[customer_index]
  end

  def select_employee
    employees = @employee_repository.all_riders
    @sessions_view.display(employees)
    employee_index = @sessions_view.ask_for('employee id').to_i - 1
    # from our meals array, return the one the user asks for
    # @employee_repository.find(employee_id)
    employees[employee_index]
  end

  def my_undelivered_orders(current_user)
    # with logged in user, return all undelivered orders
    undelivered_orders = @order_repository.my_undelivered_orders(current_user)
    @orders_view.display(undelivered_orders)
  end
end












