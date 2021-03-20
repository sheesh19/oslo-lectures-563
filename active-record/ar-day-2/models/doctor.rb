class Doctor < ActiveRecord::Base
  has_many :consultations
  has_many :patients, through: :consultations

  validates :name, presence: true
end
