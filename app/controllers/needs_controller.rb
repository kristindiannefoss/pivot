class NeedsController < ApplicationController
  def index
    @needs = NeedType.all
  end

  # before_action :set_need

  def show
  end

  def donate
    @need.add_donation(params[:need][:raised])
    redirect_to :back, notice: "Gift of $#{params[:need][:raised]} added to your basket"
  end

  def update
  end


private
  #
  # def set_need
  #   recipient = User.find_by(username: params[:username])
  #   byebug
  #   @need = recipient.needs.find_by(slug: params[:slug])
  # end

  def needs_params
    params.require(:need).permit(:name, :description, :cost, :raised, :category, :image_url )
  end

end
