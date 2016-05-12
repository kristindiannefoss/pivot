class NeedsController < ApplicationController
  def index
    @needs = NeedType.all
  end

  def show
    set_need
  end

  def donate
    set_need
    @need.add_donation(params[:need][:raised])
    redirect_to :back, notice: "Gift of $#{params[:need][:raised]} added to your basket"
  end

  def update
    set_need
  end

  def create
    require 'pry'; binding.pry
    redirect_to @user
  end

private

  def set_need
    recipient = User.find_by(username: params[:username])
    @need = recipient.needs.find_by(slug: params[:slug])
  end

  def needs_params
    params.require(:need).permit(:name, :description, :cost, :raised, :category, :image_url )
  end
end
