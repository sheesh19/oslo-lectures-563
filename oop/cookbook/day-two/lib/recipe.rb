class Recipe
  attr_reader :name, :description, :rating, :prep_time
  attr_accessor :done

  def initialize(attributes = {})
    @name         =   attributes[:name]
    @description  =   attributes[:description]
    @rating       =   attributes[:rating]
    @prep_time    =   attributes[:prep_time]
    @done         =   false || attributes[:done]
  end

  def mark_as_done!
    @done = true
  end

  def done?
    @done
  end
end
