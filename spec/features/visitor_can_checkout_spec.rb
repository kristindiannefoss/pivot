require 'rails_helper'

feature "visitor can checkout" do
  scenario "and charge a card" do
    recipient = create(:user, role: 1)
    need = create(:need, cost: 102, raised: 2)
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

      fill_in "amount", with: "100"
      click_button "add donation to cart"
    end

    expect(current_path).to eq recipient_path(recipient.username)
    expect(page).to have_content("donation added to cart")

    click_button "Checkout"

    expect(current_path).to eq checkout_path

  end
end
