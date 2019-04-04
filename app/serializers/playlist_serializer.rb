class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  has_many :songs
  has_many :artists, through: :songs
  belongs_to :user
end
