require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository

  def edit(id, edit_attribute, updated_value)
    meal = super(id, edit_attribute, updated_value)
    if edit_attribute == "name"
      meal.name = updated_value
    else
      meal.price = updated_value.to_i
    end
    save_csv
  end

  private

  def build_element(row)
    row[:id] = row[:id].to_i # convert to num
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end

#######################################
# ORIGINAL

# class MealRepository < BaseRepository

#   def initialize(csv_file)
#     @csv_file = csv_file
#     @next_id = 1
#     @meals = []
#     load_csv if File.exist?(csv_file)
#   end

#   def all
#     @meals
#   end

#   def add(meal)
#     meal.id = @next_id
#     @meals << meal
#     @next_id += 1
#     save_csv
#   end

#   def find(id)
#     @meals.find { |meal| meal.id == id }
#   end

#   private

#   def save_csv
#     CSV.open(@csv_file, "wb") do |csv|
#       csv << %w[id name price]
#       @meals.each do |meal|
#         csv << [meal.id, meal.name, meal.price]
#       end
#     end
#   end

#   def load_csv
#     csv_options = { headers: :first_row, header_converters: :symbol }
#     CSV.foreach(@csv_file, csv_options) do |row|
#       row[:id] = row[:id].to_i
#       row[:price] = row[:price].to_i
#       @meals << Meal.new(row)
#     end
#     @next_id = @meals.last.id + 1 unless @meals.empty?
#   end
# end
