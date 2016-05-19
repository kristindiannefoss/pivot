require 'rails_helper'

feature "Donor can go to profile page" do
  scenario "and edit own profile successfully" do
    donor = create(:user, role: 0)

    sign_in(donor)

    expect(page).to have_content("Logged in as #{donor.first_name.capitalize}")

    click_link "Profile"

    expect(page).to have_content(donor.username)
    expect(page).to have_content(donor.email)
    expect(page).to have_content(donor.country)

    click_button "Edit Profile"

    fill_in "First Name", with: "yo"
    fill_in "Last Name", with: "skdjh"
    fill_in "E-Mail", with: "email@email.com"
    fill_in "Username", with: "ksjdfkjsd"
    fill_in "Country", with: "Nepal"
    fill_in "URL to image", with: "girl_and_goat.jpg"
    click_button "Update Account"

    expect(current_path).to eq user_path
    expect(page).to have_content("yo")
    expect(page).to have_content("skdjh")
    expect(page).to have_content("email@email.com")
    expect(page).to have_content("Nepal")
    expect(page.find('.profile-pic')['alt']).to have_content('Girl and goat')
  end
end
