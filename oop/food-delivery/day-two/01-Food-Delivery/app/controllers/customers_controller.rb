require_relative '../repositories/customer_repository'
require_relative '../views/customers_view'

class CustomersController

  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    list_all
  end

  def add
    name = @view.ask_for(:name)
    address = @view.ask_for(:address)
    customer = Customer.new(name: name, address: address)
    @customer_repository.add(customer)
  end

  def edit
    list_all
    id = @view.ask_for(:id).to_i
    edit_attribute = @view.ask_which_attribute(:address)
    updated_value = @view.new_value
    @customer_repository.edit(id, edit_attribute, updated_value)
  end

  private

  def list_all
    customers = @customer_repository.all
    @view.display(customers)
  end
end
