class UserPlaylistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :playlist_id

  
  belongs_to :user, :playlist
end
