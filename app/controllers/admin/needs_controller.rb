class Admin::NeedsController < Admin::BaseController
  include ActionView::Helpers::TextHelper
  include NeedsHelper

  before_action :set_need, only: [:donate, :update]

  def index
    @needs = NeedType.all
    @recipient_needs = Need.all
  end

  def show
    @need = NeedType.find_by(slug: params[:slug])
    @recipient_need = Need.find_by(slug: params[:slug])
  end

  def donate
    @need.add_donation(params[:need][:raised])
    redirect_to :back, notice: "Gift of $#{params[:need][:raised]} added to your basket"
  end

  def edit
    @need = NeedType.find_by(slug: params[:slug])
  end

  def update
    @need = NeedType.find_by(slug: params[:slug])

    if @need.update(needs_params)
      flash[:notice] = "Need Type has been updated"
      redirect_to admin_needs_path
    else
      render :edit
    end
  end

  def new
    @need = NeedType.new
  end
  
  def create
    populate_needs

    flash[:notice] = "Successfully created a new Need Item"
    redirect_to admin_needs_path
  end

  def destroy
    need = NeedType.find(params[:id])
    need.destroy
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
