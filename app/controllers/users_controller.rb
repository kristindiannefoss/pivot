class UsersController < ApplicationController

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
      flash[:notice] = "Logged in as #{@user.first_name} #{@user.last_name}"
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
    params.require(:user).permit(:first_name, :last_name, :email, :address, :password, :city, :state, :zipcode)
  end
end
