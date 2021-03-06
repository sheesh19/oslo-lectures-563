class Order
  attr_accessor :id
  attr_reader :delivered, :meal, :customer, :employee

  def initialize(attr = {})
    @id = attr[:id]
    @delivered = attr[:delivered] || false
    @meal = attr[:meal]
    @customer = attr[:customer]
    @employee = attr[:employee]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
