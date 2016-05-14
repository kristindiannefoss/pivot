# require "rails_helper"
#
# feature "Admin can edit need types" do
#   scenario "as a global admin" do
#     visit admin_dasboard_path
#
#     click_link "Edit Need"
#
#     fill_in "First Name", with: "Jon"
#     fill_in "Last Name", with: "Dadork"
#     fill_in "E-Mail", with: "email@email.com"
#     fill_in "Username", with: "ksjdfkjsd"
#     fill_in "Country", with: "Nepal"
#     fill_in "Password", with: "password"
#     fill_in "Password Confirmation", with: "password"
#     select "recipient", from: "user[role]"
#     click_button "Create Account"
#
#     expect(page).to have_content("Account created!")
#
# RSpec.feature "User submits a new artist" do
#   scenario "they see the page for the individual artist" do
#     artist_name       = "Bob Marley"
#     artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
#
#     visit artists_path
#     click_on "New artist"
#     fill_in "artist_name", with: artist_name
#     fill_in "artist_image_path", with: artist_image_path
#     click_on "Create Artist"
#
#     expect(page).to have_content artist_name
#     expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
#   end
# end
#
#   end
# end
