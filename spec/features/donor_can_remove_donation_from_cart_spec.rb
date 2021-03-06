require "rails_helper"

feature "Donor can remove donation from cart" do
  scenario "successfully" do
    recipient = create(:user, role: 2)
    need = create(:need, name: "coke")
    recipient.needs = [need]

    donor = create(:user, role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(donor)

    visit recipient_path(recipient.username)

    within("##{need.id}") do
      fill_in "Amount", with: 10
      click_button "Donate"
    end

    expect(page).to have_content "Donation added to cart"

    click_link "Basket: 1"

    expect(current_path).to eq cart_path
    expect(page).to have_content "$10.00"
    expect(page).to have_content recipient.full_name
    expect(page).to have_content need.name

    click_on "Remove Donation"

    expect(current_path).to eq cart_path
    expect(page).to_not have_content "$10.00"
    expect(page).to_not have_content recipient.full_name
    expect(page).to_not have_content need.name
  end
end
