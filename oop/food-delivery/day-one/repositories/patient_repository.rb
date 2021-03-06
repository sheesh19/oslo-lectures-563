require "csv"
require_relative "../models/patient"

class PatientRepository
  #   room_repository to figure out which rooom is which since we only store ids
  def initialize(csv_path, room_repository)
    @csv_path = csv_path
    @room_repository = room_repository
    @patients = []
    @next_id = 1
    load_csv
  end

  def add(new_patient)
    # new_patient.id # => nil
    new_patient.id = @next_id
    @next_id += 1

    @patients << new_patient

    # Recreate memory into CSV
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_path, "wb") do |file|

      file << ["id", "name", "cured", "room_id"]

      @patients.each do |patient|
        file << [patient.id, patient.name, patient.cured?]
      end
    end
  end

  def load_csv
    #     de serialise this
    csv_options = { headers: true, header_converters: :symbol }

    CSV.foreach(@csv_path, csv_options) do |row|
      # Coming from the CSV we have

      # row => { id: "1" name: "Harry", cured: "true", room_id: "1" }

      # We need to update our data types from our CSV:
      # id:integer, name:string, cured:boolean, room:room instance

      row[:id] = row[:id].to_i
      row[:cured] = (row[:cured] == "true")
#       row[:room] = @room_repository.find(row[:room_id].to_i) # room instance

#       # row => { id: 1 name: "Harry", cured: true, room: #<Room:0x444> room_id: "1" }

#       @patients << Patient.new(row)
      patient = Patient.new(row)
      patient.room = @room_repository.find(row[:room_id].to_i)
      @patients << patient
    end
    @next_id = @patients.last.id + 1
  end
end


# patients = []
# csv_options = { headers: :first_row, header_converters: :symbol }
# csv_path = File.join(__dir__, '../data/patients.csv')

# room && id? 

# CSV.foreach(csv_path, csv_options) do |row|
#   row[:id]    = row[:id].to_i          # Convert column to Integer
#   row[:cured] = row[:cured] == "true"  # Convert column to boolean
#   patients << Patient.new(row)
# end


# p patients


# csv_path = File.join(__dir__, '../data/patients.csv')
# room_csv_file = File.join(__dir__, '../data/rooms.csv')
# room_repo = RoomRepository.new(room_csv_file)

# pr = PatientRepository.new(csv_path, room_repo)

# p pr.patients


# pr = PatientRepository.new(csv_path, room_repo)
# ginny = Patient.new(name: "Ginny", cured: false)
# ginny.room = room_repo.rooms.last

# pr.add(ginny)

# p pr.patients

