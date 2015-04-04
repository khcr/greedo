class ListenController < ApplicationController
  before_action :disallow_private, only: [:show]

  def index
    @channels = Channel.where(private: false)
  end

  def show
    js true, token: @channel.token
  end

  private

  def disallow_private
    @channel = Channel.find_by_slug!(params[:id])
    if @channel.private
      redirect_to listen_path, error: "Cette channel est privée"
    end
  end
end
