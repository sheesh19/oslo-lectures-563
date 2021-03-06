require 'csv'
require_relative '../models/customer'
require_relative 'base_repository'
require 'pry'

class CustomerRepository < BaseRepository

  def edit(id, edit_attribute, updated_value)
    customer = super(id, edit_attribute, updated_value)
    if edit_attribute == "name"
      customer.name = updated_value
    else
      customer.address = updated_value
    end
    save_csv
  end

  private

  def build_element(row)
    row[:id] = row[:id].to_i # Convert column to Fixnum
    Customer.new(row)
  end
end


#######################################
# ORIGINAL

# class CustomorRepository

#   def initialize(csv_file)
#     @csv_file = csv_file
#     @next_id = 1
#     @customers = []
#     load_csv if File.exist?(csv_file)
#   end

#   def all
#     @customers
#   end

#   def add(customer)
#     customer.id = @next_id
#     @customers << customer
#     @next_id += 1
#     save_csv
#   end

#   def find(id)
#     @customers.find { |customer| customer.id == id }
#   end

#   private

#   def save_csv
#     CSV.open(@csv_file, "wb") do |csv|
#       csv << %w[id name address]
#       @meals.each do |customer|
#         csv << [customer.id, customer.name, customer.address]
#       end
#     end
#   end

#   def load_csv
#     csv_options = { headers: :first_row, header_converters: :symbol }
#     CSV.foreach(@csv_file, csv_options) do |row|
#       row[:id] = row[:id].to_i
#       @customers << Customer.new(row)
#     end
#     @next_id = @customers.last.id + 1 unless @customers.empty?
#   end
# end
