class Customer
  attr_accessor :id, :name, :address

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @address = attr[:address]
  end

  # FOR OUR BASE REPOSITORIES TO WORK

  def to_csv_row
    [@id, @name, @address]
  end

  def self.headers
    %w[id name address]
  end
end
