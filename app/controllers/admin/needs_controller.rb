class Admin::NeedsController < Admin::BaseController
  include ActionView::Helpers::TextHelper

  def index
    binding.pry
    #Background: One admin user, one recipient "Jon" with 2 needs "cow", "sheep"
    #as an admin
    #when I visit "/", (where does this recipient list link live?)MANAGE RECIPIENTS link in admin nav
    #and I click on "Manage Recipients"
    #I expect to be on admin/recipients
    #and I click on recipient name
    #I expect to be on admin/recipients/slug    (admin/recipients/jon)
    #I would expect to see both "cow : 1", and "sheep : 1"
    @recipient = User.find(params[:id])
    @needs = @recipient.needs.all
  end

  def show
    #as an admin, when i view recipient index

    #and I click on a recipient

    #find the recipient I'm looking at and then their need

    #click on their need to view it

  end

  def edit

  end

  def update


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
