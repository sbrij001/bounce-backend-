class WebplayerSerializer < ActiveModel::Serializer
  attributes :id, :title, :username, :user_id

  # has_many :user_songs
  belongs_to :user
  def username
    object.user.name
  end
end
