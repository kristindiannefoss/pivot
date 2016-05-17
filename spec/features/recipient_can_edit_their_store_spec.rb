require "rails_helper"

feature "Recipient edits their store" do
  scenario "they can remove an item from their store" do
    recipient = create(:user, role: 2)
    recipient.needs.create(name: "loom")
    recipient.needs.create(name: "chair")

    ApplicationController.any_instance.stubs(:current_user).returns(recipient)

    visit edit_recipient_needs_path(recipient)

    within("#loom") do
      click_button "Remove Need"
    end

    expect(page).not_to have_content("1 loom")
    expect(page).to have_content("1 chair")
  end

  scenario "they can change the amount" do

  end
end
