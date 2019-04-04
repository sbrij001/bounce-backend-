class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :birthday

  has_many :playlists
  has_many :songs, through: :playlists
  # belongs_to: :location
end
