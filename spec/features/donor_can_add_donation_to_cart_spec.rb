require "rails_helper"

feature "Donor can add donation to cart" do
  scenario "successfully" do
    recipient = create(:user, role: 2)
    need1 = create(:need, name: "goat", total: 14, raised: 0)
    need2 = create(:need, name: "soda", total: 14, raised: 0)
    recipient.needs = [need1, need2]

    donor = create(:user, role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(donor)

    visit recipient_path(recipient.username)

    within("##{need1.id}") do
      fill_in "Amount", with: 10
      click_button "Donate"
    end

    within("##{need2.id}") do
      fill_in "Amount", with: 5
      click_button "Donate"
    end

    expect(page).to have_content "Donation added to cart"

    click_link "Basket: 2"

    expect(current_path).to eq cart_path
    expect(page).to have_content "$10.00"
    expect(page).to have_content recipient.full_name
    expect(page).to have_content need1.name
    expect(page).to have_content "$5.00"
    expect(page).to have_content recipient.full_name
    expect(page).to have_content need2.name
  end
end
