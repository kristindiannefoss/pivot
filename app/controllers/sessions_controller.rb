class SessionsController < ApplicationController
 #before_action :save_cart, only: [:destroy]

  def new
    set_redirect
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      if user.cart = "{}"
        session[:cart] = { "donor" => {}, "recipient" => {} }
      else
        session[:cart] = JSON.parse(user.cart)
      end
      session[:user_id] = user.id
      flash[:notice] = "Logged in as #{user.first_name.capitalize}"
      if current_admin?
        redirect_to admin_profile_path
      else
        redirect_to session[:redirect]
      end
    else
      flash.now[:error] = "Invalid Credentials"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

private

  def save_cart
    cart = session[:cart].to_json
    current_user.update(cart: cart)
  end
end
