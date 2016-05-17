class NeedsController < ApplicationController
  include ActionView::Helpers::TextHelper
  include NeedsHelper

  before_action :set_need, only: [:donate, :update]

  def index
    @needs = NeedType.all
    @categories = Category.filter_categories
  end

  def show
    @need = NeedType.find_by(slug: params[:slug])
  end

  def update
  end

  def create
    results = populate_needs
    flash[:notice] = "The following needs were added to your profile: #{results.first.join(', ')}." unless results.first.nil?
    flash[:error] = "At least one of each of the following needs has already been requested: #{results.last.join(', ')}. Please modify existing requests from your profile." unless results.last.empty?
    session[:cart] = {}
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
