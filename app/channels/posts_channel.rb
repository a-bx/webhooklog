class PostsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "posts_#{params[:room]}"
  end

  def receive(data)
    ActionCable.server.broadcast("posts_#{params[:room]}", data)
  end
end
