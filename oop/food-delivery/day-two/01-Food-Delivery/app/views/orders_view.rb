require_relative 'base_view'

class OrdersView < BaseView

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.employee.username} must deliver #{order.meal.name} to #{order.customer.name}"
    end
  end

#  def display(orders)
#    orders.each do |order|
#      puts "#{order.id} - #{order.customer.name} #{order.meal.name}"
#    end
#  end
end

