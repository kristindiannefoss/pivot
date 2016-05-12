require "rails_helper"

feature "Recipient adds needs to store" do
  scenario "needs are visible in profile" do
    recipient = create(:user, role: 1)
    need = create(:need_type, name: "loom")

    ApplicationController.any_instance.stubs(:current_user).returns(recipient)

    visit user_path(recipient)
    click_link "Add Needs"

    within("#loom") do
      click_button "Add to Basket"
    end

    click_link "Basket: 1"



    click_button "Approve Needs"
    expect(current_path).to eq "/profile"

    expect(page).to have_content("loom")
  end
end
