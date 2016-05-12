class NeedsController < ApplicationController
  # def new
  #   @need = Need.new
  # end
  #
  # def create
  #   @need = Need.create(needs_params)
  # end

  def index
    # @category = Category.find(params [:name])
    @needs = Need.all
  end
  #
  # def needs_params
  #   params.require(:need).permit(:name, :description, :cost, :raised, :category, :image_url )
  # end
end
