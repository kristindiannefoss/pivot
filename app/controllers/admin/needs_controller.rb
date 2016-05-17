class Admin::NeedsController < Admin::BaseController
  include ActionView::Helpers::TextHelper

  def edit
    @recipient = User.find_by(username: params[:username])
    @needs = @recipient.needs.all
  end
end
