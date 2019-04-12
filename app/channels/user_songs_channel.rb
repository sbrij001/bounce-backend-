class UserSongsChannel < ApplicationCable::Channel

  # expects an object from the model
  def subscribed
    webplayer = Webplayer.find(params[:webplayer])
    stream_for webplayer
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
