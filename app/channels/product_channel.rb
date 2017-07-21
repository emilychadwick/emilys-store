#be sure to restart server when running this file. Action Cable runs in a loop that doesn't support auto reloading

class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "product_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
