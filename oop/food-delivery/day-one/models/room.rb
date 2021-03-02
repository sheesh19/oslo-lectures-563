class Room
  attr_reader :number, :patients
  attr_accessor :id

  def initialize(attrs = {})
    @id = attrs[:id]
    @number = attrs[:number] # integer
    @capacity = attrs[:capacity] || 1
    @patients = [] # array of Patient instances
  end

  def add_patient(new_patient)
    if full?
      puts "Cannot add #{new_patient.name}, to #{self.number}. Room over capacity!"
    else
      new_patient.room = self
      @patients << new_patient
    end
  end

  def full?
    @patients.count >= @capacity
  end
end
