class Api::V1::UserPlaylistsController < ApplicationController

  def index
    @userPlaylists = UserPlaylists.all
    render json: @userPlaylists
  end

  def create
    byebug
    if @user.valid?
      @user_playlists = UserPlaylist.create(user_playlists_params)
      render json: @userPlaylists
    else
      byebug
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_playlists_params
    # byebug
    params.require(:user_playlist).permit(:user_id, :playlist_id)
  end
end
