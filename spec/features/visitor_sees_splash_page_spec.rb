require 'rails_helper'

feature "visitor can view splash page" do
  scenario "lands on root and views aspects of splash page" do
    splash_image_path = "banner.jpg"
    visit root_path

    expect(page).to have_content("Goats and Soda")
    expect(page).to have_link("Donate")
    save_and_open_page
    expect(page).to have_css("img[alt=Banner]")
  end
end
