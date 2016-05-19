require "rails_helper"

feature "Recipient removes needs from cart" do
  scenario "needs are no longer visible in profile" do
    recipient = create(:user, role: 2)
    need1 = create(:need_type, name: "notgoat")
    need2 = create(:need_type, name: "notsoda")

    ApplicationController.any_instance.stubs(:current_user).returns(recipient)

    visit user_path(recipient)
    click_link "Needs Catalog"

    within("#notgoat") do
      click_button "Add to Basket"
    end

    within("#notsoda") do
      click_button "Add to Basket"
    end

    click_link "Basket: 2"

    expect(current_path).to eq "/cart"

    first(".cart-remove").click_link("Remove")

    expect(page).to have_content("Successfully removed from basket")

    expect(page).to_not have_content("notgoat")
    expect(page).to have_content("Basket: 1")

    visit user_path(recipient)
    click_link "Needs Catalog"

    within("#notgoat") do
      click_button "Add to Basket"
    end

    click_link "Basket: 2"

    first(".cart-remove").click_link("Remove")

    expect(page).to have_content("Successfully removed from basket")

    expect(page).to_not have_content("notsoda")
    expect(page).to have_content("Basket: 1")
  end
end
