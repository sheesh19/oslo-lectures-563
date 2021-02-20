class Building
  attr_reader :name, :width, :length

  def initialize(name, width, length)
    @name   =   name
    @width  =   width
    @length =   length
  end


  # What kind of method are we using here?
  # INTANCE METHOD

  def floor_area
    @width * @length
  end
end




# What classes have we used?
# -> Time
# -> JSON

# What class METHODS have we used?
# -> Time.now
# -> JSON.parse

# class Time

#   def self.now
#   end
# end


