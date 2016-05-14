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
    rejected = []
    approved = []
    session[:cart].each do |id, qty|
      need_type = NeedType.find(id)
      if current_user.needs.exists?(slug: need_type.slug)
        rejected << need_type.name
      else
        current_user.needs.create(name: pluralize(qty, need_type.name),
                                  description: need_type.description,
                                  cost: need_type.cost * qty,
                                  image_url: need_type.image_url,
                                  slug: need_type.slug,
                                  category: need_type.category
                                  )
        approved << need_type.name
      end
    end
    flash[:notice] = "The following needs were added to your profile: #{approved.join(', ')}." unless approved.nil?
    flash[:error] = "At least one of each of the following needs has already been requested: #{rejected.join(', ')}. Please modify existing requests from your profile." unless rejected.nil?
    session[:cart] = {}
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
