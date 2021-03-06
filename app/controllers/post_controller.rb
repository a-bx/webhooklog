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
    respond_to do |format|
      format.html do
        broadcast_params params
      end
      format.json do
        broadcast
      end
    end
  end

  def broadcast
    @key = params[:key]
    params[:headers] = request.headers.env.select { |k, _| k =~ /^HTTP_/ }
    broadcast_params params
    render json: params, status: 200
  end

  private

  def broadcast_params(params)
    ActionCable.server.broadcast "posts_#{@key}",
                                 params: params
  end

  def check_secret
    response.headers['X-Hook-Secret'] = request.headers['X-Hook-Secret']
  end

  def build_key
    SecureRandom.hex
  end
end
