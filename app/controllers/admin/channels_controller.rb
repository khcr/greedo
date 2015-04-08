class Admin::ChannelsController < Admin::BaseController
  before_action { |c| c.authorize_level(2) }

  def index
    @table = Table.new(self, Channel, nil, search: true)
    @table.respond
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to admin_channels_path, success: "Channel créée"
    else
      render 'new'
    end
  end

  def edit
    @channel = Channel.find(params[:id])
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update_attributes(channel_params)
      redirect_to admin_channels_path, success: "Channel enregistrée"
    else
      render 'edit'
    end
  end

  def destroy
    Channel.find(params[:id]).destroy
    redirect_to admin_channels_path, success: "Channel supprimé"
  end

  private

  def channel_params
    params.require(:channel).permit(:description, :name, :private, :image)
  end
end
