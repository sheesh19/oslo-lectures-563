require 'csv'
require_relative 'recipe'

class Cookbook

  def initialize(csv_file_path)
    @csv_file_path    =   csv_file_path
    @recipes          =   []
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  def mark_recipe_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done!
    save_csv
  end

  private

  # REFACTOR WITH CSV HEADERS

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["name", "description", "rating", "prep_time", "done"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time, recipe.done?]
      end
    end
  end

  def load_csv
    # adds each attribute key from Review as a header
    # make sure to add: name, description, rating, prep_time, done in your CSV to work this code

    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # CSV only saves strings -> we need to change strings into booleans
      row[:done] = row[:done] == "true"

      # Create a new Recipe via row -> with our headers, row returns a hash like this:
      # {name: row[0], description: row[1], rating: row[2], prep_time: row[3], done: done}
      @recipes << Recipe.new(row)
    end
  end



  # def load_csv
  #   CSV.foreach(@csv_file_path) do |row|
  #     done = row[4] == 'true'
  #     @recipes << Recipe.new(name: row[0], description: row[1], rating: row[2], prep_time: row[3], done: done)
  #   end
  # end

  # def save_csv
  #   CSV.open(@csv_file_path, 'wb') do |csv|
  #     @recipes.each do |recipe|
  #       csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time, recipe.done]
  #     end
  #   end
  # end
end
