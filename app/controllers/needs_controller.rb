class NeedsController < ApplicationController
  include ActionView::Helpers::TextHelper
  include NeedsHelper

  before_action :set_need, only: [:donate, :update]

  def index
    @needs = NeedType.all
  end

  def show
    @need = NeedType.find_by(slug: params[:slug])
  end

  def donate
    @need.add_donation(params[:need][:raised])
    redirect_to :back, notice: "Gift of $#{params[:need][:raised]} added to your basket"
  end

  def update
  end

  def create
    populate_needs
    redirect_to user_path
  end

private

  def set_need
    recipient = User.find_by(username: params[:username])
    @need = recipient.needs.find_by(slug: params[:slug])
  end

  def needs_params
    params.require(:need).permit(:name, :description, :cost, :raised, :category, :image_url)
  end
end
