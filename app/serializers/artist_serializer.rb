class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :songs
  has_many :playlist, through: :songs
end
