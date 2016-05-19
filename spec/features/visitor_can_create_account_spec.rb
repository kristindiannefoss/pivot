require "rails_helper"

feature "Visitor can create account" do
  scenario "as a donor" do
    visit signup_path

    fill_in "First Name", with: "Jon"
    fill_in "Last Name", with: "Dadork"
    fill_in "E-Mail", with: "email@email.com"
    fill_in "Username", with: "ksjdfkjsd"
    fill_in "Country", with: "Nepal"
    fill_in "URL to image", with: "goat-girl.jpg"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    select "donor", from: "user[role]"
    click_button "Create Account"

    expect(page).to have_content("Account created!")
    expect(User.first.role).to eq "donor"
  end

  scenario "as a recipient" do
    visit signup_path

    fill_in "First Name", with: "Jon"
    fill_in "Last Name", with: "Dadork"
    fill_in "E-Mail", with: "email@email.com"
    fill_in "Username", with: "ksjdfkjsd"
    fill_in "Country", with: "Nepal"
    fill_in "URL to image", with: "goat-girl.jpg"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    select "recipient", from: "user[role]"
    click_button "Create Account"

    expect(page).to have_content("Account created!")
    expect(User.first.role).to eq "recipient"
  end
end
