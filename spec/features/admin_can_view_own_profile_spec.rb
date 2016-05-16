require "rails_helper"

feature "Admin can view own profile" do
  scenario "as a global admin" do

    admin = User.create(first_name: "Kris", last_name: "Foss", email: "kris.foss@gmail.com", password: "password", role: 1, username: "Kris", country: "US")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_profile_path

    expect(page).to have_content("Welcome Administrator : #{admin.first_name}")
    expect(page).to have_content("Role: admin")
    expect(page).to have_content("Username: #{admin.username}")
    expect(page).to have_content("Email: #{admin.email}")
  end
end
