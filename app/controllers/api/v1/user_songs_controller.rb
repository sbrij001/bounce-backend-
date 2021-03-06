class Api::V1::UserSongsController < ApplicationController

  def create
    user_song = User_songs.new(user_songs_params)
    webplayer = Webplayer.find(user_songs_params[:webplayer_id])
    if user_song.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        UserSongsSerializer.new(user_song)
      ).serializable_hash
      UserSongsChannel.broadcast_to webplayer, serialized_data
      head :ok
    end
  end

  # def create
  #   playedsong = User_songs.new(playedsong_params)
  #   webplayer = Webplayer.find(playedsong_params[:webplayer_id])
  #   if playedsong.save
  #     serialized_data = ActiveModelSerializers::Adapter::Json.new(
  #       PlayedsongsSerializer.new(playedsong)
  #     ).serializable_hash
  #     PlayedsongsChannel.broadcast_to webplayer, serialized_data
  #     head :ok
  #   end
  # end

  private

  def user_songs_params
    params.require(:user_song).permit(:song, :webplayer_id)
  end
end
