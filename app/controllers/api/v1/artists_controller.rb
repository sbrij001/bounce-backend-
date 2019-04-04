class Api::V1::ArtistsController < ApplicationController

  def index
    @artists = Artist.all
    render json: @artists
  end

  def show
    @artist = Artist.find(params[:id])
  end

  private
  
  def artist_params
    params.permit(:name, :song_id)
  end

end
