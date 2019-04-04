class Api::V1::SongsController < ApplicationController
  def index
    @songs = Song.all
    render json: @songs
  end

  def show
    @song = Song.find(params[:id])
  end

  private
  def song_params
    params.permit(:title)
  end
end
