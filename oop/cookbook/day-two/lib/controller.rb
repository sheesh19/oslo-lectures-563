require_relative 'view'
require_relative 'cookbook'

class Controller

  def initialize(cookbook)
    @cookbook   =   cookbook
    @view       =   View.new
  end

  def list
    display_recipes
  end

  def create
    name = @view.ask_for('name')
    description = @view.ask_for('description')
    @cookbook.add_recipe(Recipe.new(name, description))
    display_recipes
  end

  def destroy
    index = @view.ask_for_index
    @cookbook.remove_recipe(index)
  end

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
