require 'rails_helper'

describe SessionsController, type: :controller do
  before do
  end

  context "can display session" do
    it "render index of needs" do
      get :new

      expect(response).to have_http_status :success
      expect(response).to render_template :new
    end
  end
end



