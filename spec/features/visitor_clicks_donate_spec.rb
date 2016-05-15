require "rails_helper"

feature "visitor sees the recipients page" do
  scenario "clicks donate and sees recipients" do
    user1, user2 = create_list(:user, 2, role: 2)

    visit root_path
    click_link "Donate"

    expect(page).to have_content(user1.first_name)
    expect(page).to have_content(user1.country)

    expect(page).to have_content(user2.first_name)
    expect(page).to have_content(user2.country)
  end
end
