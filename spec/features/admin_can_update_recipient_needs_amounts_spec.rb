require "rails_helper"

feature "Admin updates Recipient needs" do
  scenario "page reflects change" do
    admin = create(:user, role: 1)
    recipient = create(:user, role: 2, username: "HarryP", first_name: "Harry", last_name: "Potter")
    category = create(:category, name: "animals")

    need = category.needs.create(name: "Cow",
                           description: "Bovine Lactation",
                           cost: 46,
                           image_url: "auto_maintenance.png",
                           quantity: 1)

                            recipient.needs = [need]

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit root_path
    click_link "Manage Recipients"

    expect(current_path).to eq("/admin/recipients")

    click_link recipient.full_name

    within "#Cow" do
      expect(page).to have_content("Cow: 1")

      fill_in "Quantity", with: 2
      click_button "Update Amount"
    end

    expect(current_path).to eq("/admin/recipients/HarryP")
    expect(page).to have_content("Needs updated")
    expect(page).to have_content("Cow: 2")
  end
end
