class WebplayerChannel < ApplicationCable::Channel
  # expects to receive a string as an argument
  def subscribed
    stream_from "webplayers_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
