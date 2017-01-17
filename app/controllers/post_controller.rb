require 'securerandom'
# broadcast controller
class PostController < ApplicationController
  before_action :check_secret

  def index
    @key = build_key
    redirect_to "/endpoint/#{@key}"
  end

  def endpoint
    @key = params[:key]
  end

  def broadcast
    @key = params[:key]
    params[:headers] = request.headers.env.select { |k, _| k =~ /^HTTP_/ }

    ActionCable.server.broadcast "posts_#{@key}",
                                 params: params

    render plain: 'OK', status: 200
  end

  def check_secret
    response.headers['X-Hook-Secret'] = request.headers['X-Hook-Secret']
  end

  def build_key
    SecureRandom.hex
  end
end
