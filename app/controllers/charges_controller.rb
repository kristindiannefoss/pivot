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
      current_user.donations.where(id: @cart.contents["donor"].values.flatten).update_all(status: "completed")
      @total = @cart.total_donor_cost
      session[:cart] = Cart.new(nil)
      @cart = session[:cart]
    end
  end
end
