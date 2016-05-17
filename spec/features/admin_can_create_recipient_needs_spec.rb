require "rails_helper"

feature "Admin can create Recipient needs" do
  scenario "as a global admin" do
    need_url = "https://upload.wikimedia.org/wikipedia/commons/d/d4/CH_cow_2_cropped.jpg"

    admin = User.create(first_name: "Kris", last_name: "Foss", email: "kris.foss@gmail.com", password: "password", role: 1, username: "Kris", country: "US")

    recipient = User.create(first_name: "Harry", last_name: "Potter", email: "potter@gmail.com", password: "password", role: 2, username: "HarryP", country: "UK")

    category = Category.create(name: "animals")

    need = category.needs.create(name: "Cow",
                           description: "Bovine Lactation",
                           cost: 46,
                           image_url: "auto_maintenance.png",
                           slug: "auto-maintenance",
                           category_id: 1)


    need2 = category.needs.create(name: "Sheep",
                            description: "For Wool and Hugs",
                            cost: 46,
                            image_url: "sheep.png",
                            slug: "sheep",
                            category_id: 1)

                            recipient.needs = [need]

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_profile_path
    click_link "All Users"
    click_link "#{recipient.first_name}"

    save_and_open_page
    expect(page).to have_content("Cow")
    expect(page).to_not have_content("Sheep")

    click_link "Add New Needs"
    within "Sheep" do
      click_link "Add Need To Recipient"
    end

    expect(page).to have_content("Cow")
    expect(page).to have_content("100")
  end
end
