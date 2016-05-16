require "rails_helper"

feature "Admin can view a specific need show page" do
  scenario "as a global admin" do
    need_url = "https://upload.wikimedia.org/wikipedia/commons/d/d4/CH_cow_2_cropped.jpg"
    admin = User.create(first_name: "Kris", last_name: "Foss", email: "kris.foss@gmail.com", password: "password", role: 1, username: "Kris", country: "US")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    need = NeedType.create(
    name: "Cow",
    description: "Bovine Lactation",
    cost: 100,
    category_id: 1,
    image_url:  need_url )

    visit admin_need_types_path
    click_link "Cow"
    
    expect(page).to have_content("Welcome Administrator : #{admin.first_name}")
    expect(page).to have_content("Role: admin")
    expect(page).to have_content("Username: #{admin.username}")
    expect(page).to have_content("Email: #{admin.email}")
  end
end
