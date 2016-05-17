require "rails_helper"

feature "Admin can create need types" do
  scenario "as a global admin" do
    need_url = "https://upload.wikimedia.org/wikipedia/commons/d/d4/CH_cow_2_cropped.jpg"

    admin = User.create(first_name: "Kris", last_name: "Foss", email: "kris.foss@gmail.com", password: "password", role: 1, username: "Kris", country: "US")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_profile_path

    click_link "Add New Need Types"

    fill_in "Name", with: "Cow"
    fill_in "Description", with: "Bovine Lactation"
    fill_in "Cost", with: "100"
    fill_in "Category", with: 1 #changing this with Category table
    fill_in "Image Url", with: need_url

    click_button "Create Need Type"

    expect(page).to have_content("Cow")
    expect(page).to have_content("Bovine Lactation")
    expect(page).to have_content("100")
  end
end
