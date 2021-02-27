class View

  def ask_for(element)
    puts "What is the #{element}?"
    gets.chomp
  end

  def ask_for_index
    puts "Which index?"
    gets.chomp.to_i - 1
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} - #{recipe.description}"
    end
  end
end
