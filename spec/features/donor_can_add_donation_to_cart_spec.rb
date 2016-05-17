require "rails_helper"

feature "Donor can add donation to cart" do
  scenario "successfully" do
    recipient = create(:user, role: 2)
    need1 = create(:need, name: "goat")
    need2 = create(:need, name: "soda")
    recipient.needs = [need1, need2]

    donor = create(:user, role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(donor)

    visit recipient_path(recipient.username)

    within("##{need1.id}") do
      fill_in "Amount", with: 10
      click_button "Add donation to cart"
    end

    within("##{need2.id}") do
      fill_in "Amount", with: 5
      click_button "Add donation to cart"
    end

    expect(page).to have_content "Donation added to cart"

    click_link "Basket: 2"

    expect(current_path).to eq cart_path
    expect(page).to have_content "Donate $10.00 to #{recipient.full_name} for #{need1.name}"
    expect(page).to have_content "Donate $5.00 to #{recipient.full_name} for #{need2.name}"
  end
end
