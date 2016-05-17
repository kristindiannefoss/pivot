require 'rails_helper'

feature "Donor can go to profile page" do
  scenario "and edit own profile successfully" do
    skip
     donor = create(:user, role: 0)

     #sign_in(donor)

     visit login_path



     expect(page).to have_content("Logged in as #{donor.first_name}")

     expect(page).to have_link("Profile")

     click_link "Profile"

     #expect(current_path). to eq(/profile??????????????)
     #hurry up LINK-LISS!!!! let's merge your stuff! so i can see what i have to work with!!!!
     #

     expect(page).to have_content("user.full_name")
     expect(page).to have_content("user.username")
     expect(page).to have_content("user.email")
     expect(page).to have_content("user.country")
  end
end
