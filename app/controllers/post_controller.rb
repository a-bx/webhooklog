require 'securerandom'

class PostController < ApplicationController
  def index
    @key = build_key
    redirect_to "/endpoint/#{@key}"
  end

  def endpoint
    @key = params[:key]
  end

  def broadcast
    @key = params[:key]
    ActionCable.server.broadcast "posts_#{@key}",
                                 params: params

    response.headers['X-Hook-Secret'] = request.headers['X-Hook-Secret']

    render plain: 'Ok', status: 200
  end

  def build_key
    SecureRandom.hex
  end
end
