require 'rails_helper'

feature "visitor sees the filter page" do
  scenario "clicks donate and sees filter categories" do
    visit root_path
    click_link "Donate"

    expect(page).to have_content("Donate By Region")
    expect(page).to have_content("Donate By Need")
    expect(page).to have_content("Donate By Greatest Need")
  end
end
