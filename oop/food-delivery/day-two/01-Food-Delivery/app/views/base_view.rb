class BaseView
  def ask_for(label)
    puts "What is the #{label}?"
    print '> '
    gets.chomp
  end

  def ask_which_attribute(attribute)
    puts "Do you want to edit the name or the #{attribute}?"
    gets.chomp
  end

  def new_value
    puts "What is the new value?"
    gets.chomp
  end
end
