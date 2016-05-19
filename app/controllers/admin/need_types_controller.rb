class Admin::NeedTypesController < Admin::BaseController
  include ActionView::Helpers::TextHelper
  before_action :set_need_type, only: [:show, :edit, :update, :destroy]

  def index
    @need_types = NeedType.all
  end

  def show
  end

  def edit
  end

  def update
    if @need_type.update(needs_params)
      flash[:notice] = "Need Type has been updated"
      redirect_to admin_need_types_path
    else
      render :edit
    end
  end

  def new
    @need_type = NeedType.new
  end

  def create
    @need_type = NeedType.create(needs_params)
    if @need_type.save
      flash[:notice] = "Successfully created a new need"
      redirect_to admin_need_types_path
    else
      flash.now[:error] = @need_type.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @need_type.destroy
    redirect_to admin_need_types_path
  end

private

  def needs_params
    category = params[:need_type][:category]
    params[:need_type][:category] = Category.find_or_create_by(name: category)
    params.require(:need_type).permit(:name, :description, :cost,  :category, :image_url)
  end

  def set_need_type
    @need_type = NeedType.find(params[:id])
  end
end
