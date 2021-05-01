class Pet < ApplicationRecord
  SPECIES = %w(cat shark dog rabbit kangaroo orca student fox)

  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES }

  def found_days_ago
    (Date.today - found_on).to_i
  end
end
