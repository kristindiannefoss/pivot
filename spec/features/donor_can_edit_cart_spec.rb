require "rails_helper"

feature "Donor can edit cart" do
  xscenario "successfully" do
    recipient = create(:user, role: 2)
    need = create(:need, name: "goat", quantity: 1, cost: 12)
    recipient.needs = [need]

    donor = create(:user, role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(donor)

    visit recipient_path(recipient.username)

    within("##{need.id}") do
      fill_in "Amount", with: 10
      click_button "Donate"
    end

    click_link "Basket: 1"

    expect(page).to have_content "$10.00"
    expect(page).to have_content recipient.full_name
    expect(page).to have_content need.name

    within("##{need.slug}") do
      fill_in "donation[amount]", with: 12
      click_on "Update Amount"
    end

    expect(page).to have_content "$12.00"
  end
  scenario "unsuccessfully" do
    recipient = create(:user, role: 2)
    need = create(:need, name: "goat", quantity: 1, cost: 12)
    recipient.needs = [need]

    donor = create(:user, role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(donor)

    visit recipient_path(recipient.username)

    within("##{need.id}") do
      fill_in "Amount", with: 10
      click_on "Donate"
    end

    click_link "Basket: 1"

    expect(page).to have_content "$10.00"
    expect(page).to have_content recipient.full_name
    expect(page).to have_content need.name

    within("##{need.slug}") do
      fill_in "donation[amount]", with: 15
      click_on "Update Amount"
    end

    expect(page).to have_content "$10.00"
  end
end
