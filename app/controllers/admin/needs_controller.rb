class Admin::NeedsController < Admin::BaseController
  include ActionView::Helpers::TextHelper
  include NeedsHelper
  before_action :set_recipient, only: [:index, :create, :destroy, :update]

  def index
    @needs = NeedType.all
    @categories = Category.filter_categories
  end

  def create
    flash[:notice] = grant_need(params[:need_id])
    redirect_to :back
  end

  def destroy
    need = @recipient.needs.find(params[:id])
    need.destroy
    flash[:notice] = "#{need.name} removed from #{@recipient.full_name}'s page."
    redirect_to :back
  end

  def update
    need = @recipient.needs.find(params[:id])
    need.update(need_params)
    flash[:notice] =  "#{@recipient.full_name} is now requesting #{need.quantity} #{need.name.pluralize(need.quantity)}."
    redirect_to :back
  end

private

  def need_params
    params.require(:need).permit(:quantity)
  end

  def set_recipient
    @recipient = User.find_by(username: params[:username])
  end
end
