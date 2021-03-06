class SessionsView
  def ask_for(stuff)
    puts "What is the #{stuff}?"
    print "> "
    return gets.chomp
  end

  def print_wrong_credentials
    puts "Wrong credentials... Try again"
  end
end
