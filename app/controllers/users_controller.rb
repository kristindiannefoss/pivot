class UsersController < ApplicationController
  before_action :set_roles_for_dropdown, only: [:edit, :update, :new, :create]

  def index
    @recipients = User.where(role: 1)
  end

  def new
    set_redirect
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account created!"
      redirect_to session[:redirect]
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(current_user.id)
    @donations = @user.donations
  end

  def recipient
    @recipient = User.find_by(username: params[:username])
  end

private

  def user_params
    set_role_to_int(params)
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :city, :country, :password_confirmation, :role)
  end

  def set_role_to_int(params)
    if ("0".."9").include?(params[:user][:role])
      params[:user][:role] = params[:user][:role].to_i
    end
  end

  def set_roles_for_dropdown
    @roles = User.roles.dup
    @roles.delete("Admin")
  end
end
