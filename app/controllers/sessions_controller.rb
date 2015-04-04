class SessionsController < ApplicationController
  before_action :connected?, except: :destroy

  def new
  end

  def create
    @user = User.where("lower(name) = ?", params[:session][:name].strip.downcase).first
    if @user && @user.authenticate(params[:session][:password])
      params[:session][:remember_me] == '1' ? sign_in_permanent(@user) : sign_in(@user)
      redirect_back_or profile_path, success: "Connecté !"
    else
      flash.now[:error] = "Nom d'utilisateur et/ou mot de passe erroné"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path, success: "Déconnecté !"
  end

  private

  def connected?
    redirect_to profile_path unless current_user.nil?
  end

end