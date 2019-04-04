class Api::V1::PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
    render json: @playlists
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  private
  def playlist_params
    params.permit(:name, :song_id)
  end
end
