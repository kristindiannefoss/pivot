class NeedsController < ApplicationController
  include ActionView::Helpers::TextHelper
  def index
    @needs = NeedType.all
  end

  def show
    set_need
  end

  def donate
    set_need
    @need.add_donation(params[:need][:raised])
    redirect_to :back, notice: "Gift of $#{params[:need][:raised]} added to your basket"
  end

  def update
    set_need
  end

  def create
    session[:cart].each do |id, qty|
      need_type = NeedType.find(id)

      current_user.needs.create( name: pluralize(qty, need_type.name),
                              description: need_type.description,
                              cost: need_type.cost * qty,
                              image_url: need_type.image_url,
                              slug: need_type.slug,
                              category: need_type.category
                              )
    end
    redirect_to user_path
  end

private

  def set_need
    recipient = User.find_by(username: params[:username])
    @need = recipient.needs.find_by(slug: params[:slug])
  end

  def needs_params
    params.require(:need).permit(:name, :description, :cost, :raised, :category, :image_url)
  end
end
