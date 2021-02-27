require_relative 'cookbook'
require_relative 'view'
require_relative 'scraper'
require 'pry'

class Controller

  def initialize(cookbook)
    @cookbook   =   cookbook
    @view       =   View.new
  end

  def list
    display_recipes
  end

  def create
    name = @view.ask_for_('name')
    description = @view.ask_for_('description')
    rating = @view.ask_for_('rating')
    prep_time = @view.ask_for_('prep_time')
    recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    @cookbook.add_recipe(recipe)
    display_recipes
  end

  def destroy
    display_recipes
    index = @view.ask_which_index('do you want to delete')
    @cookbook.remove_recipe(index)
    display_recipes
  end

  def import
    keyword = @view.ask_for_search_word

    # scrape via our scraper
    import_recipes = Scraper.new(keyword).call

    @view.display(import_recipes)
    index = @view.ask_which_index('do you want to save?')
    recipe = import_recipes[index]
    @cookbook.add_recipe(recipe)
  end

  def mark_as_done
    # ask which index has been completed
    # update the recipe in the cookbook
    display_recipes
    index = @view.ask_which_index('have you completed?')
    @cookbook.mark_recipe_as_done(index)
    display_recipes
  end

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end

end
