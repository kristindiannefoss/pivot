require "rails_helper"

feature "visitor sees the recipients page" do
  scenario "they see only the recipients with needs" do
    need = create(:need)
    user1 = create(:user, role: 2, first_name: "Jim", country: "Rwanda")
    user2 = create(:user, role: 2, first_name: "Jane", country: "Botswana")
    user1.needs = [need]

    visit root_path
    click_link "Donate"

    expect(page).to have_content("Jim")
    expect(page).to have_content("Rwanda")

    expect(page).to_not have_content("Jane")
    expect(page).to_not have_content("Botswana")
  end
end
