class UserSongsSerializer < ActiveModel::Serializer
  attributes :id, :webplayer_id, :song, :created_at
end
