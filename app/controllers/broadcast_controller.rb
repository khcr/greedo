class BroadcastController < ApplicationController
  before_action { |c| c.authorize_level(3) }

  def index
    @channels = Channel.all
  end

  def show
    @channel = Channel.find_by_slug!(params[:id])
    js true, token: @channel.token
    render 'show', turbolinks: false
  end
end
