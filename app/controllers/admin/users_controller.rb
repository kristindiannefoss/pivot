class Admin::UsersController < Admin::BaseController

  before_action :set_roles, only: [:edit, :update, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "#{@user.first_name} #{@user.last_name} Account Created"
      redirect_to admin_users_path
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def index
    @admins = User.where(role: 1)
    @recipients = User.where(role: 2)
    @donors = User.where(role: 0)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "User account for #{@user.first_name} #{@user.last_name} has been updated"
      redirect_to admin_users_path
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    set_role_to_int(params)
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :image_url, :city, :country, :password_confirmation, :role)
  end

  def set_role_to_int(params)
    if ("0".."9").include?(params[:user][:role])
      params[:user][:role] = params[:user][:role].to_i
    end
  end

  def set_roles
    @roles = User.roles
  end
end
