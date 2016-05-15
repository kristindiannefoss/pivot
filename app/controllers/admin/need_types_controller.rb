class Admin::NeedTypesController < Admin::BaseController
  include ActionView::Helpers::TextHelper

  def index
    @need_types = NeedType.all
  end

  def show
    @need_type = NeedType.find(params[:id])
  end

  def edit
    @need_type = NeedType.find(params[:id])
  end

  def update
    @need_type = NeedType.find(params[:id])

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
    need_type = NeedType.find(params[:id])
    need_type.destroy
    redirect_to admin_need_types_path
  end

private

  def needs_params
    params.require(:need_type).permit(:name, :description, :cost,  :category, :image_url)
  end
end
