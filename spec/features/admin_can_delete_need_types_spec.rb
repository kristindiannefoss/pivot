require "rails_helper"

feature "Admin can delete need types" do
  scenario "as a global admin" do
    need_url1 = "https://upload.wikimedia.org/wikipedia/commons/d/d4/CH_cow_2_cropped.jpg"

    admin = User.create(first_name: "Kris", last_name: "Foss", email: "kris.foss@gmail.com", password: "password", role: 1, username: "Kris", country: "US")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit "/admin/profile"
    click_link "Add Need to Catalog"
    fill_in "need_type[name]", with: "Cow"
    fill_in "Description", with: "Bovine Lactation"
    fill_in "Cost", with: "100"
    fill_in "Image Url", with: need_url1

    click_button "Create Need Type"

    visit admin_profile_path
    click_link "All Needs"

    click_button "Delete"

    expect(page).to_not have_content("Cow")
    expect(page).to_not have_content("Bovine Lactation")
    expect(page).to_not have_content("100")

  end
end
