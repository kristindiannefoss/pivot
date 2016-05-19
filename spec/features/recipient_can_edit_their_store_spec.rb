require "rails_helper"

feature "Recipient edits their store" do
  scenario "needs are removed from their store" do
    recipient = create(:user, role: 2)
    need1 = create(:need, name: "loom", quantity: 1)
    need2 = create(:need, name: "chair", quantity: 1)
    recipient.needs = [need1, need2]

    ApplicationController.any_instance.stubs(:current_user).returns(recipient)

    visit "/profile"

save_and_open_page
    within("#loom") do
      expect(page).to have_content("loom")
      expect(page).to have_content("1")
    end

    within("#chair") do
      expect(page).to have_content("chair")
      expect(page).to have_content("1")
    end

    within("#loom") do
      click_button "Remove Need"
    end

    expect(page).to have_content("loom removed from your needs.")

    within("#chair") do
      expect(page).to have_content("chair")
    end
  end

  scenario "they can change the amount" do
    recipient = create(:user, role: 2)
    need1 = create(:need, name: "loom", quantity: 1)
    need2 = create(:need, name: "chair", quantity: 1)
    recipient.needs = [need1, need2]

    ApplicationController.any_instance.stubs(:current_user).returns(recipient)

    visit "/profile"


    within("#loom") do
      expect(page).to have_content("1")
    end

    within("#chair") do
      expect(page).to have_content("1")
    end

    within("#loom") do
      fill_in "Quantity", with: 2
      click_button "Update Amount"
    end

    expect(page).to have_content("You are now requesting 2 looms.")


    within("#loom") do
      expect(page).to have_content("2")
    end
  end
end
