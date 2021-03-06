require 'pry'
require_relative '../models/order'

class OrderRepository

  def initialize(csv_file, meals_controller, customers_controller, sessions_controller)
    @csv_file = csv_file
    @meal_repository = meals_controller
    @employee_repository = sessions_controller
    @customer_repository = customers_controller
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def my_undelivered_orders(current_user)
    @orders.select { |order| order.delivered? != true && current_user == order.employee }
  end

  def add(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id delivered meal_id customer_id employee_id]
      @orders.each do |order|
        # We need to store ids inside our CSVs
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      # We need to store instances inside our Order.new
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)    # "1" => Meal instance
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      @orders << Order.new(row)
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end
end
