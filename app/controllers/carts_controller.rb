class CartsController < ApplicationController

  def create
    set_redirect
    need = NeedType.find(params[:need_id])
    flash[:notice] = @cart.add_need(need.id, need.max)
    session[:cart] = @cart.contents
    redirect_to session[:redirect]
  end

  def show
    @needs = @cart.mapped_values || {}
  end

  def update
    qty = params[:session][:quantity].to_i
    @cart.update(params[:need_id], qty)
    redirect_to cart_path
  end

  def destroy
    need = Need.find(params[:id])
    @cart.remove_need(params[:id])
    flash[:notice] = "Successfully removed <a href=\"/needs/#{need.id}\">#{need.name}</a>!"
    redirect_to cart_path
  end
end
