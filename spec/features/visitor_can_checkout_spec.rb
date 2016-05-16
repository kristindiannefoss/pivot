require 'rails_helper'

feature "Visitor can checkout" do
  scenario "without being registered" do
    recipient = create(:user, role: 1)
    need = create(:need)
    recipient.needs = [need]

    visit recipient_path(recipient.username)

    expect(page).to have_content(recipient.first_name)
    expect(page).to have_content(recipient.last_name)
    expect(page).to have_content(recipient.country)
    expect(page).to have_content(recipient.description)
    expect(page).to have_content(recipient.total)

    within("##{need.id}") do
      expect(page).to have_link(recipient.needs.first.name)
      expect(page).to have_content(recipient.needs.first.raised)
      expect(page).to have_content(recipient.needs.first.cost)

      fill_in "Amount", with: "100"
      click_button "Add donation to cart"
    end

    expect(current_path).to eq recipient_path(recipient.username)
    expect(page).to have_content("Gift of $100 added to your basket")
    expect(page).to have_content("Raised: $102")
  end
end
