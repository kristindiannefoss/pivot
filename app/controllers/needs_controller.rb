class NeedsController < ApplicationController
  before_action :set_need

  def show
  end

  def donate
    @need.add_donation(params[:need][:raised])
    redirect_to :back, notice: "Gift of $#{params[:need][:raised]} added to your basket"
  end

  def update
  end

private

  def set_need
    recipient = User.find_by(username: params[:username])
    @need = recipient.needs.find_by(slug: params[:slug])
  end

  def need_params
    params.require(:need).permit(:name, :description, :cost, :raised)
  end
end
