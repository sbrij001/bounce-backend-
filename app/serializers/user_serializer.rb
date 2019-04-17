class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :birthday

  has_many :user_playlists
  has_many :playlists, through: :user_playlists
  has_many :songs, through: :playlists
  has_many :webplayers
  # belongs_to: :location
end
