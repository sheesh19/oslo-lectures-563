require_relative 'base_view'

class OrdersView < BaseView

  def display(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.customer.name} #{order.meal.name}"
    end
  end
end

