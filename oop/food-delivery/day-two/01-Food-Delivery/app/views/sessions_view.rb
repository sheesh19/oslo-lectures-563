class SessionsView

  def display(employees)
    employees.each do |employee|
      puts "#{employee.id} - #{employee.username} | #{employee.role} }"
    end
  end

  def ask_for(stuff)
    puts "What is the #{stuff}?"
    print "> "
    return gets.chomp
  end

  def print_wrong_credentials
    puts "Wrong credentials... Try again"
  end
end
