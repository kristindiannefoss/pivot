class NeedsController < ApplicationController
  include ActionView::Helpers::TextHelper
  include NeedsHelper

  def index
    @needs = NeedType.all
    @categories = Category.filter_categories
  end

  def show
    @need = NeedType.find_by(slug: params[:slug])
  end

  def donate
    recipient = User.find_by(username: params[:username])
    @need = recipient.needs.find_by(slug: params[:slug])
    @need.add_donation(params[:need][:raised])
    redirect_to :back, notice: "Gift of $#{params[:need][:raised]} added to your basket"
  end

  def update
    need = current_user.needs.find(params[:id])
    need.update(needs_params)

    redirect_to :back, notice: "You are now requesting #{need.quantity} #{need.name.pluralize(need.quantity)}."
  end

  def destroy
    need = current_user.needs.find(params[:id])
    need.destroy
    redirect_to :back, notice: "#{need.name} removed from your needs."
  end

  def create
    results = populate_needs
    flash[:notice] = "The following needs were added to your profile: #{results.first.join(', ')}." unless results.first.empty?
    flash[:error] = "At least one of each of the following needs has already been requested: #{results.last.join(', ')}. Please modify existing requests from your profile." unless results.last.empty?
    session[:cart] = { "donor" => {}, "recipient" => {} }
    redirect_to user_path
  end

private

  def needs_params
    params.require(:need).permit(:quantity)
  end
end
