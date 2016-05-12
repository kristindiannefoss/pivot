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
      flash[:notice] = "Created Account!"
      redirect_to session[:redirect]
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(current_user.id)
    @orders = @user.orders
  end

  def recipient
    @recipient = User.find_by(username: params[:username])
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :city, :country, :password_confirmation, :role)
  end
end
