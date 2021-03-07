require_relative 'base_view'

class OrdersView < BaseView

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} - #{order.customer.name} #{order.meal.name}"
    end
  end
end

