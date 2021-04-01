require 'csv'
require_relative '../models/room'

class RoomRepository
  attr_reader :rooms

  def initialize(csv_path)
    @csv_path = csv_path
    @csv_options = { headers: :first_row, header_converters: :symbol }
    @rooms = []
    load_csv
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  private

  def load_csv
    CSV.foreach(@csv_path, @csv_options) do |row|
      # Typecasting -> updating our data types
      # id:integer, number:string
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i

      @rooms << Room.new(row)
    end
  end
end


# room_csv_file = File.join(__dir__, '../data/rooms.csv')
# room_repo = RoomRepository.new(room_csv_file)

# p room_repo.rooms
