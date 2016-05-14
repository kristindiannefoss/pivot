require "rails_helper"

feature "visitor can view splash page" do
  scenario "lands on root and views aspects of splash page" do
    splash_image_path = "Boy-and-goat_wide_web.jpg"
    visit root_path

    expect(page).to have_css('img[alt="Wholelogo"]')
    expect(page).to have_link("Donate")
  end
end
