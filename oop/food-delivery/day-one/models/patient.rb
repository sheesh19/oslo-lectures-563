class Patient
  attr_reader :name
  attr_accessor :room, :id

  # def initialize(id, name, cured, room)

  def initialize(attrs = {})
    # attrs => { name: "Harry", cured: true }
    @id = attrs[:id] # Integer
    @name = attrs[:name] # String
    @cured = attrs[:cured] || false # boolean
    @room = attrs[:room]
  end

  # BEHAVIOR
  # instance methods
  def cured?
    @cured
  end
end

# PREVIOUS
# Patient.new( 'Harry', 1, true, 1)
# Patient.new({name: 'Harry', id: 1, cured: false, ...})
