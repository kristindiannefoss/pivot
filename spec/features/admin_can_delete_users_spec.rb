require "rails_helper"

feature "Admin can delete user" do
  scenario "as a global admin" do
    need_url = "https://www.globalgiving.org/pfil/6658/pict_original.jpg"

    admin = User.create(first_name: "Kris", last_name: "Foss", email: "kris.foss@gmail.com", password: "password", role: 1, username: "Kris", country: "US")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_profile_path
    click_link "Add New User"

    fill_in "First Name", with: "Jon"
    fill_in "Last Name", with: "Ownsagemandactslikeit"
    fill_in "E-Mail", with: "email@email.com"
    fill_in "Username", with: "ksjdfkjsd"
    fill_in "Country", with: "Nepal"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    select "recipient", from: "user[role]"
    click_button "Create User Account"

    within ".user#{User.last.id}" do
      click_button "Delete"
    end

    expect(page).to_not have_content("Jon Ownsagemandactslikeit")
    expect(page).to_not have_content("email@email.com")
    expect(page).to_not have_content("ksjdfkjsd")
    expect(page).to_not have_content("Nepal")
    expect(page).to_not have_content("recipient")
  end
end
