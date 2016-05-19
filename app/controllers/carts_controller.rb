class CartsController < ApplicationController

  def create
    set_redirect
    @need = NeedType.find(params[:need_id])
    flash[:notice] = @cart.add_need(@need.id, @need.max)
    session[:cart] = @cart.contents

    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js   {}
    end
  end

  def show
    if current_user && current_user.recipient?
      @needs = @cart.create_cart_needs || {}
    else
      if @cart.contents["donor"]
        recipients = User.find(@cart.contents["donor"].keys)
        @recipients_donations = find_objects_from_cart_values(recipients)
      else
        @recipients_donations = {}
      end
    end
  end

  def update
    qty = params[:session][:quantity].to_i
    @cart.update(params[:need_id], qty)
    flash[:notice] = "Successfully updated basket"
    redirect_to cart_path
  end

  def destroy
    @cart.remove_need(params[:id])
    session[:cart] = @cart.contents
    flash[:notice] = "Successfully removed from basket"
    redirect_to cart_path
  end

private

  def find_objects_from_cart_values(recipients)
    recipients.inject({}) do |hash, recipient|
      hash[recipient] ||= []
      hash[recipient] = Donation.find(@cart.contents["donor"][recipient.id.to_s])
      hash
    end
  end
end
