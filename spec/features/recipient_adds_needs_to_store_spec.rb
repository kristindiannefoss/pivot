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

    expect(page).to have_content("The following needs were added to your profile: loom.")
    within("#main_body") do
      expect(page).to have_content("1 loom")
    end

    expect(page).to have_content("Basket: 0")
  end

  scenario "cannot add item that already exists" do
    recipient = create(:user, role: 1)
    need = create(:need_type, name: "loom")

    ApplicationController.any_instance.stubs(:current_user).returns(recipient)

    2.times do
      visit user_path(recipient)
      click_link "Add Needs"

      within("#loom") do
        click_button "Add to Basket"
      end

      click_link "Basket: 1"

      click_button "Approve Needs"
    end

    expect(page).to have_content("At least one of each of the following needs has already been requested: loom. Please modify existing requests from your profile.")

    expect(page).to have_content("Basket: 0")
  end
end
