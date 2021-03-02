require "csv"
require_relative "../models/room"

class RoomRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @rooms = []
    load_csv
  end

  def find(id)
    @rooms.find { |room| room.id = id }
  end

  private

  def load_csv
    csv_options = { headers: true, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      # Typecasting -> updating our data types
      # id:integer, number:string
      row[:id] = row[:id].to_i

      @rooms << Room.new(row)
    end
  end
end
