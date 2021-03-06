require "rails_helper"

feature "visitor views recipient page" do
  scenario "successfully" do
    recipient = create(:user, role: 2)
    need = create(:need)
    recipient.needs = [need]

    visit recipient_path(recipient.username)

    expect(page).to have_content recipient.first_name
    expect(page).to have_content recipient.last_name
    expect(page).to have_content recipient.country
    expect(page).to have_content recipient.total
    expect(page).to have_content recipient.raised
    expect(page).to have_content recipient.needs.first.name
    expect(page).to have_content recipient.needs.last.name
  end
end
