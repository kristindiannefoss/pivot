require "rails_helper"

feature "Recipient adds needs to store" do
  scenario "needs are visible in profile" do
    recipient = create(:user, role: 2)
    need = create(:need_type, name: "loom")

    ApplicationController.any_instance.stubs(:current_user).returns(recipient)

    visit user_path(recipient)
    click_link "Needs Catalog"

    within("#loom") do
      click_button "Add to Basket"
    end

    click_link "Basket: 1"

    click_on "Approve Needs"
    expect(current_path).to eq "/profile"

    expect(page).to have_content("Added: loom.")
    expect(page).not_to have_content("At least one of each of the following needs has already been requested:")

    within("#main_body") do
      expect(page).to have_content("loom: 1")
    end

    expect(page).to have_content("Basket: 0")
  end

 scenario "cannot add item that already exists" do
    recipient = create(:user, role: 2)
    need = create(:need_type, name: "loom")

    ApplicationController.any_instance.stubs(:current_user).returns(recipient)

    2.times do
      visit user_path(recipient)
      click_link "Needs Catalog"

      within("#loom") do
        click_button "Add to Basket"
      end

      click_link "Basket: 1"

      click_on "Approve Needs"
    end

    expect(page).to have_content("loom already in store.")

    expect(page).to have_content("Basket: 0")
  end
end
