class Admin::NeedsController < Admin::BaseController
  include ActionView::Helpers::TextHelper
  include NeedsHelper

  def index
    @recipient = User.find_by(username: params[:username])
    @needs = NeedType.all
    @categories = Category.filter_categories
  end

  def create
    @recipient = User.find_by(username: params[:username])
    flash[:notice] = grant_need(params[:need_id])
    redirect_to :back
  end

end
