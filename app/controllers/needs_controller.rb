class NeedsController < ApplicationController
  include ActionView::Helpers::TextHelper
  include NeedsHelper
  before_action :find_needs, only: [:update, :destroy]

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
    @need.update(needs_params)
    redirect_to :back, notice: "You are now requesting #{@need.quantity} #{@need.name.pluralize(@need.quantity)}."
  end

  def destroy
    @need.destroy
    redirect_to :back, notice: "#{@need.name} removed from your needs."
  end

  def create
    results = populate_needs
    flash[:notice] = "Added: #{results.first.join(', ')}." unless results.first.empty?
    flash[:error] = "#{results.last.join(', ')} already in store." unless results.last.empty?
    session[:cart] = { "donor" => {}, "recipient" => {} }

    respond_to do |format|
      format.html {}
      format.js   {}
    end
    redirect_to user_path
  end

private

  def needs_params
    params.require(:need).permit(:quantity)
  end

  def find_needs
    @need = current_user.needs.find(params[:id])
  end
end
