class Admin::UsersController < Admin::BaseController
  before_action { |c| c.authorize_level(1) }

  def index
    @table = Table.new(self, User)
    @table.respond
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, success: "Utilisateur crée"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, success: "Utilisateur enregistré"
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_activities_path, success: "Utilisateur supprimé"
  end

  def profile
  end

  private

  def user_params
    params.require(:user).permit(:name, :level, :password, :password_confirmation)
  end
end