class View

  def display(recipes)
    puts "---------------------------------"
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} | #{recipe.done? ? 'X': ' '} | #{recipe.rating} | #{recipe.prep_time} | #{recipe.description}"
    end
  end

  def ask_for_(input)
    puts "What is the #{input}?"
    gets.chomp
  end

  def ask_which_index(sentence)
    puts "Which number #{sentence}?"
    gets.chomp.to_i - 1
  end

  def ask_for_search_word
    puts "What do you want to search for?"
    gets.chomp
  end
end

