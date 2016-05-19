class ChargesController < ApplicationController
  def new
  end

  def create
    begin
      @amount = @cart.total_donor_cost * 100

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Goats and Soda Donation',
        :currency    => 'usd'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    else
      donations = set_donations
      donations.send_to_recipients
      clear_cart
      @amount /= 100
    end
  end

private

  def set_donations
    if current_user
      current_user.donations.set_status_complete(
        @cart.contents["donor"].values.flatten
      )
      current_user.donations
    else
      x = Donation.where(user_id: nil).set_status_complete(
        @cart.contents["donor"].values.flatten
      )
      Donations.where(user_id: nil)
    end
  end

  def clear_cart
    session[:cart] = Cart.new(nil)
    @cart = session[:cart]
  end
end
