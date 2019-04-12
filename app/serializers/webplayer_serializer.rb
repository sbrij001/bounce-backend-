class WebplayerSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_many :user_songs
end
