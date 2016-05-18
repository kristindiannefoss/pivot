class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :set_cart
  helper_method :current_user, :set_redirect, :current_admin?, :current_user_guest, :has_need?

  def set_redirect
    if request.referrer == nil
      session[:redirect] = root_path
    elsif URI(request.referrer).path == "/login" || URI(request.referrer).path == "/signup"
      session[:redirect] = root_path
    else
      session[:redirect] = URI(request.referrer).path || root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_guest
    current_user.nil?
  end

  def set_cart
    if session[:cart] == {"contents"=>{"donor"=>{}, "recipient"=>{}}}
      @cart = Cart.new(nil)
    else
      @cart ||= Cart.new(session[:cart])
    end
  end

 # def require_user
 #   redirect_to "/errors/not_found.html" unless current_user
 # end

  def current_admin?
    current_user && current_user.admin?
  end

  def has_need?(recipient)
    recipient.needs.any?
  end
end
