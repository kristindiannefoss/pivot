require "rails_helper"

feature "Admin can view a specific need show page" do
  scenario "as a global admin" do
    need_url = "https://upload.wikimedia.org/wikipedia/commons/d/d4/CH_cow_2_cropped.jpg"
    admin = User.create(first_name: "Kris", last_name: "Foss", email: "kris.foss@gmail.com", password: "password", role: 1, username: "Kris", country: "US")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    category = Category.create(name: "animals")

    need = category.need_types.create(name: "Cow",
                           description: "Bovine Lactation",
                           cost: 46,
                           image_url: "auto_maintenance.png",
                           slug: "auto-maintenance",
                           category_id: 1)

    need2 = category.need_types.create(name: "Sheep",
                           description: "For Wool and Hugs",
                           cost: 46,
                           image_url: "sheep.png",
                           slug: "sheep",
                           category_id: 1)

    visit admin_need_types_path
    click_link "Cow"

    expect(page).to have_content("Cow")
    expect(page).to have_content("Bovine Lactation")
    expect(page).to_not have_content("Sheep")
    expect(page).to_not have_content("For Wool and Hugs")
  end
end
