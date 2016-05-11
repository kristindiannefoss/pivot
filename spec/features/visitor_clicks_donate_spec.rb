require 'rails_helper'

feature "visitor sees the recipients page" do
  scenario "clicks donate and sees recipients" do
    visit root_path
    click_link "Donate"

    expect(page).to have_content("Jim")
    expect(page).to have_content("Nepal")
    expect(page).to have_content("$100")

    expect(page).to have_content("Jane")
    expect(page).to have_content("Cambodia")
    expect(page).to have_content("$150")

    # find_id(receiver.id).click
  end
end
