require_relative 'building'
require_relative 'wizard'

# How do we inherit?

class Castle < Building
  attr_reader :name
  attr_accessor :butler, :ruler

  def initialize(name, ruler, width, length)
    @width  =   width
    @length =   length
    @name   =   name
    @ruler  =   ruler

    # self = instance we just created
    # hogwarts = Castle.new(......)
    # self = hogwarts

    @wizard =   Wizard.new(self)
  end

  # def name
  #   puts "HELLO I AM OVERRIDING"
  # end


  def floor_area
    # what does super call here?
    super + 300
    # (@width * @length) + 300
  end



  # INSTANCE METHOD
  # -> calls a method on ONE instance

  def has_a_wizard?
    @wizard != nil
  end


  # CLASS METHOD
  # -> calls a method on the ENTIRE class || could include all instances

# def Castle.categories
  def self.categories
    return ['Medieval', 'Norman', 'Ancient', 'Fantasy']
  end


  # SELF -> ??? METHOD

  def castle_details
    # self -> refers to the instance it is called upon
    # is self required here, though?
    # self = instance we call castle_details on

    # hogwarts.castle_details
    # self = hogwarts

    "#{@name} is ruled by #{self.ruler_name}"
  end

  def ruler_name
    @ruler.capitalize
  end
end
