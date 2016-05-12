require "rails_helper"

feature "visitor sees the recipients page" do
  scenario "clicks donate and sees recipients" do
    recipient = create(:user, role: 1)
    need = create(:need_type, name: "loom")

    ApplicationController.any_instance.stubs(:current_user).returns(recipient)

    visit user_path(recipient)
    click_link "Add Needs"

    within("#loom") do
      click_button "Add to Basket"
    end

    click_link "Basket: 1"

    

    click_link "Approve Needs"

    expect(page).to have_content("loom")
  end
end
