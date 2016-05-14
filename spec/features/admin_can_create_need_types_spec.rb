require "rails_helper"

feature "Admin can edit need types" do
  scenario "as a global admin" do
    visit admin_profile_path

    click_link "Create Need"

    fill_in "Name", with: "Cow"
    fill_in "Description", with: "Bovine Lactation"
    fill_in "Cost", with: "100"
    fill_in "Raised", with: "0"
    fill_in "Category", with: "Animals" #changing this with Category table
    fill_in "Image Url", with: "https://upload.wikimedia.org/wikipedia/commons/d/d4/CH_cow_2_cropped.jpg"

    click_button "Create Need"

    expect(page).to have_content("Account created!")

RSpec.feature "User submits a new artist" do
  scenario "they see the page for the individual artist" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit artists_path
    click_on "New artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end

  end
end
