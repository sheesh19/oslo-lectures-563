require_relative '../repositories/meal_repository'
require_relative '../views/meals_view'

class MealsController

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    list_all
  end

  def add
    name = @view.ask_for(:name)
    price = @view.ask_for(:price).to_i
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
  end

  def edit
    list_all
    id = @view.ask_for(:id).to_i
    edit_attribute = @view.ask_which_attribute(:price)
    updated_value = @view.new_value
    @meal_repository.edit(id, edit_attribute, updated_value)
  end

  def destroy
    list_all
    id = @view.ask_for(:id).to_i
    @meal_repository.destroy(id)
    list_all
  end

  private

  def list_all
    meals = @meal_repository.all
    @view.display(meals)
  end
end
