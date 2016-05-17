class Admin::NeedsController < Admin::BaseController
  include ActionView::Helpers::TextHelper

  def index
    @needs = Need.all
  end

  def show
    @need = User.needs.find(params[:id])
  end

  def edit
    @need = User.needs.find(params[:id])
  end

  def update
    @need = User.needs.find(params[:id])

    if @need.update(needs_params)
      flash[:notice] = "Need has been updated"
      redirect_to admin_needs_path
    else
      render :edit
    end
  end

  def new
    @need = User.needs.new
  end

  def create
    @need = User.needs.create(needs_params)

    if @need.save
      flash[:notice] = "Successfully created a new need"
      redirect_to admin_needs_path
    else
      flash.now[:error] = @need.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    need = User.need.find(params[:id])
    need.destroy
    redirect_to admin_needs_path
  end

private

  def needs_params
    category = params[:need][:category]
    params[:need][:category] = Category.find_or_create_by(name: category)
    params.require(:need).permit(:name, :description, :cost,  :category, :image_url)
  end
end
