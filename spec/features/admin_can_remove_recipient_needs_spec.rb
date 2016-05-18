require "rails_helper"

feature "Admin removes Recipient needs" do
  scenario "the need is removed" do
    admin = create(:user, role: 1)
    recipient = create(:user, role: 2, username: "HarryP", first_name: "Harry", last_name: "Potter")
    category = create(:category, name: "animals")

    need = category.needs.create(name: "Cow",
                           description: "Bovine Lactation",
                           cost: 46,
                           image_url: "auto_maintenance.png",
                           quantity: 1)


    need2 = category.needs.create(name: "Sheep",
                            description: "For Wool and Hugs",
                            cost: 46,
                            image_url: "sheep.png",
                            quantity: 1)

                            recipient.needs = [need, need2]

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit root_path
    click_link "Manage Recipients"

    expect(current_path).to eq("/admin/recipients")

    click_link recipient.full_name

    expect(page).to have_content("Cow")
    expect(page).to have_content("Sheep")

    within "#Sheep" do
      click_on "Remove Need"
    end

    expect(page).to have_content("Sheep removed from Harry Potter's page.")
    expect(current_path).to eq("/admin/recipients/HarryP")

    within "#needs" do
      expect(page).to have_content("Cow")
      expect(page).to_not have_content("Sheep")
    end
  end
end
