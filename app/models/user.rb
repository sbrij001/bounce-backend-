class User < ApplicationRecord
  has_secure_password
  # validates :name, uniqueness: { case_sensitive: false }

  has_many :playlists
  has_many :songs, through: :playlists

end
