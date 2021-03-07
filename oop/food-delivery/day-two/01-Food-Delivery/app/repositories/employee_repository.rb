require 'csv'
require_relative '../models/employee'
# require_relative 'base_repository'

class EmployeeRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @next_id = 1
    @employees = []
    load_csv if File.exist?(csv_file)
  end

  def all_riders
    @employees.select { |employee| employee.role == 'rider' }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  private

  def build_element(row)
    row[:id] = row[:id].to_i # Convert column to Fixnum
    Employee.new(row)
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @employees << build_element(row)
      @next_id += 1
    end
  end
end
