class List < ApplicationRecord
  # does not create anything in our DB
  # create the AR association => list.bookmarks
  has_many :bookmarks, dependent: :destroy

  # list.bookmarks.map { |bm| bm.movies } => list.movies
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
end

