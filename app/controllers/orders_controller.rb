class DonationsController < ApplicationController
  before_action :require_user
  before_action :set_donation, only: [:show]
  before_action :redirect_if_no_donation, only: [:show]

  def index
    @user = current_user
    @donations = @user.donations
  end

  def show
    @donation_items = DonationItem.where(donation_id: @donation.id) if @donation
  end

  def create
    @donation = current_user.donations.new
    if @donation.save
      @donation.donation_confirmed(@cart)
      session.delete :cart
      flash[:notice] = "Donation was successfully pprocessed"
      redirect_to donations_path
    else
      flash.now[:error] = "Please log in to place an donation"
      redirect_to login_path
    end
  end

  private

  def set_donation
    @donation = current_user.donations.find_by(id: params[:donation_id])
  end

  def redirect_if_no_donation
    redirect_to "/errors/not_found.html" unless @donation
  end

  def donation_params
    params.require(:donation).permit(:user_id)
  end
end
