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

  # NOTE ABOUT LOAD_CSV:

  # Since we have a hash of attributes when we instantiate our Recipe (the def initialize(attributes = {}) ), we need to have a hash when we create our Recipe.new .
  # We added headers at the top of our csv && passed the option header_converters: :symbol , which makes the row into a hash when we load it.
  # Since each row is now a hash from our CSV, we can use row[:done]  to access the value. Our CSV has everything saved as strings, but in our Recipe we need a boolean value. When we run:
  #    row[:done] = row[:done] == 'true'
  # we are running a comparison- if the csv value is ‘true’ , we’ll re-write the value of row[:done] as a boolean true and use boolean value when we create the new Recipe instance.



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
