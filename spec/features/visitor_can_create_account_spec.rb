#require "rails_helper"
#
#feature "Visitor can create account" do
#  scenario "as a donor" do
#    visit signup_path
#
#    fill_in "First Name", with: "Jon"
#    fill_in "Last Name", with: "Dadork"
#    fill_in "E-Mail", with: "email@email.com"
#    fill_in "Username", with: "ksjdfkjsd"
#    fill_in "Country", with: "Nepal"
#    fill_in "Password", with: "password"
#    fill_in "Password Confirmation", with: "password"
#    select "Recipient", from: "user[role]"
#    click_button "Create Account"
#
#    expect(page).to have_content("Account created!")
#  end
#end
#
