class Artist < ApplicationRecord
  has_many :songs
  has_many :playlist, through: :songs
end
