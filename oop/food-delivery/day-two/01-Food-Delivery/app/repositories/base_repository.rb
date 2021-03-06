require 'csv'

class BaseRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @next_id = 1
    @elements = []
    load_csv if File.exist?(csv_file)
  end

  def all
    @elements
  end

  def find(id)
    set_element(id)
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_csv
  end

  def edit(id, edit_attribute, updated_value)
    element = set_element(id)
  end

  def destroy(id)
    element = set_element(id)
    @elements.delete(element)
    save_csv
  end

  private

  def set_element(id)
    @elements.find { |element| element.id == id }
  end


  # YOU CAN ALSO KEEP YOUR SAVE & LOAD CSV IN THE OTHER REPOSITORIES
  # USING THE SAVE & LOAD CSV IN THE BASE REQUIRES UPDATES TO OUR MODELS

  def save_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << build_element(row)
      @next_id += 1
    end
  end

end
