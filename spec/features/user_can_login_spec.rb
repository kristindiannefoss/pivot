require "rails_helper"

RSpec.feature "user can login" do
  scenario "with valid credentials" do
    user = create(:user)
    visit '/login'
    fill_in "E-Mail", with: user.email
    fill_in "Password", with: "password"
    click_button "Log in"

    assert_equal root_path, current_path

    expect(page).to have_content "Logged in as #{user.first_name}"
    expect(page).to_not have_link "Login"
    expect(page).to have_button "Logout"
  end
end
