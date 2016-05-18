require 'rails_helper'

feature "Visitor can checkout" do
  scenario "and add donations to their cart" do
    recipient = create(:user, role: 1)
    need = create(:need, cost: 102, raised: 2, quantity: 1)
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
    expect(page).to have_content("Donation added to cart")
  end
end
