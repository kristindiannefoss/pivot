class Admin::RecipientsController < Admin::BaseController

  def index
    @users = User.where(role: User.roles["recipient"])
  end

  def show
    user = User.find_by(username: params[:username])
    @needs = user.needs
  end
end
