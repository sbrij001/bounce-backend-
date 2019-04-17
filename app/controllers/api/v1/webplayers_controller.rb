class Api::V1::WebplayersController < ApplicationController

  def index
    webplayers = Webplayer.all
    render json: webplayers
  end

# since our create methods are broadcasting the data to our channels rather than rendering the JSON directly.
# ActionCable.server.broadcast method used in the WebplayerController, which accepts as arguments a string for which channel to broadcast to as well as the data to be broadcast (notice that this string corresponds to the string we provided in our ConversationsChannel’s subscribed method).
  def create
    webplayer = Webplayer.new(webplayer_params)
    if webplayer.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        WebplayerSerializer.new(webplayer)
      ).serializable_hash
      ActionCable.server.broadcast 'webplayers_channel', serialized_data
      head :ok
    end
  end

  # def update
  #   webplayer = Webplayer.new(webplayer_params)
  #   if webplayer.save
  #     serialized_data = ActiveModelSerializers::Adapter::Json.new(
  #       WebplayerSerializer.new(webplayer)
  #     ).serializable_hash
  #     ActionCable.server.broadcast 'webplayers_channel', serialized_data
  #     head :ok
  #   end
  # end

  private

  def webplayer_params
    params.require(:webplayer).permit(:title, :user_id)
  end
end
