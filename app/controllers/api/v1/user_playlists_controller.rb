class Api::V1::UserPlaylistsController < ApplicationController

  def index
    @userPlaylists = UserPlaylist.all
    render json: @userPlaylists
  end

  def create
    # byebug
    @user_playlist = UserPlaylist.create(user_playlists_params)
    if @user_playlist.valid?
      render json: @user_playlist
    else
      render json: { error: 'failed to create user playlist' }, status: :not_acceptable
    end
  end

  private

  def user_playlists_params
    # byebug
    params.require(:user_playlist).permit(:user_id, :playlist_id, :napster_playlist_id)
  end
end
