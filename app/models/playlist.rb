class Playlist < ApplicationRecord
  has_many :songs
  has_many :user_playlists
  has_many :artists, through: :songs
  has_many :users, through: :user_playlists
end
