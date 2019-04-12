class UserPlaylistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :playlist_id, :napster_playlist_id


  belongs_to :user
  belongs_to :playlist
end
