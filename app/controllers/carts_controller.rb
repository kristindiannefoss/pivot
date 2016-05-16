class CartsController < ApplicationController

  def create
    set_redirect
    need = NeedType.find(params[:need_id])
    flash[:notice] = @cart.add_need(need.id, need.max)
    session[:cart] = @cart.contents
    redirect_to session[:redirect]
  end

  def show
    if current_user.recipient?
      @needs = @cart.create_cart_needs || {}
      require "pry"; binding.pry
    else
      recipients = User.find(@cart.contents["donor"].keys)
      require "pry"; binding.pry
      @recipients_donations = recipients.inject({}) do |hash, recipient|
        hash[recipient] = recipient.donations
        hash
      end
    end
  end

  def update
    qty = params[:session][:quantity].to_i
    @cart.update(params[:need_id], qty)
    flash[:notice] = "Successfully updated cart"
    redirect_to cart_path
  end

  def destroy
    @cart.remove_need(params[:id])
    session[:cart] = @cart.contents
    flash[:notice] = "Successfully removed from cart"
    redirect_to cart_path
  end
end
