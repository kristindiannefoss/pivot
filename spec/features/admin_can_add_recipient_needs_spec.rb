require "rails_helper"

feature "Admin creates Recipient needs" do
  scenario "the recipient does not have the need" do
    admin = create(:user, role: 1)
    recipient = create(:user, role: 2, username: "HarryP", first_name: "Harry", last_name: "Potter")
    category = create(:category, name: "animals")

    need = category.needs.create(name: "Cow",
                           description: "Bovine Lactation",
                           cost: 46,
                           image_url: "auto_maintenance.png",
                           quantity: 1)


    need2 = category.need_types.create(name: "Sheep",
                            description: "For Wool and Hugs",
                            cost: 46,
                            image_url: "sheep.png")

                            recipient.needs = [need]

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit root_path
    click_link "Manage Recipients"

    expect(current_path).to eq("/admin/recipients")

    click_link recipient.full_name

    expect(page).to have_content("Cow")
    expect(page).to_not have_content("Sheep")

    click_on "Add New Needs"

    expect(current_path).to eq("/admin/recipients/HarryP/needs")

    within "#sheep" do
      click_on "Add Need to Recipient"
    end

    expect(current_path).to eq("/admin/recipients/HarryP/needs")
    expect(page).to have_content("Sheep added to Harry Potter's cart.")

    visit "/admin/recipients/HarryP"

    expect(page).to have_content("Sheep")
    expect(page).to have_content("Cow")
  end
  scenario "the recipient already has the need" do
    admin = create(:user, role: 1)
    recipient = create(:user, role: 2, username: "HarryP", first_name: "Harry", last_name: "Potter")
    category = create(:category, name: "animals")

    need = category.needs.create(name: "Cow",
                           description: "Bovine Lactation",
                           cost: 46,
                           image_url: "auto_maintenance.png",
                           quantity: 1)


    need2 = category.need_types.create(name: "Cow",
                           description: "Bovine Lactation",
                           cost: 46,
                           image_url: "auto_maintenance.png")

                            recipient.needs = [need]

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit root_path
    click_link "Manage Recipients"

    expect(current_path).to eq("/admin/recipients")

    click_link recipient.full_name

    expect(page).to have_content("Cow")

    click_on "Add New Needs"

    expect(current_path).to eq("/admin/recipients/HarryP/needs")

    within "#cow" do
      click_on "Add Need to Recipient"
    end

    expect(current_path).to eq("/admin/recipients/HarryP/needs")
    expect(page).to have_content("Cow is already in Harry Potter's cart.")

    visit "/admin/recipients/HarryP"

    expect(page).to have_content("Cow")
    expect(page).not_to have_content("Sheep")
  end
end
