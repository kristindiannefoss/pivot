require "rails_helper"

feature "Admin can edit need types" do
  scenario "as a global admin" do
    need_url1 = "https://upload.wikimedia.org/wikipedia/commons/d/d4/CH_cow_2_cropped.jpg"
    need_url2 = "https://www.google.com/imgres?imgurl=https://upload.wikimedia.org/wikipedia/commons/d/d4/CH_cow_2_cropped.jpg&imgrefurl=https://en.wikipedia.org/wiki/Cattle&h=2912&w=2912&tbnid=Ye7bnTUqTVLDCM:&tbnh=186&tbnw=186&docid=bQHwC8Dr7qayRM&itg=1&usg=__X7W4mSq_SACi9jA2PMPbjS5T7gI=#h=2912&imgdii=Ye7bnTUqTVLDCM%3A%3BYe7bnTUqTVLDCM%3A%3BaZfjOshtTr0NfM%3A&tbnh=186&tbnw=186&w=2912"

    admin = User.create(first_name: "Kris", last_name: "Foss", email: "kris.foss@gmail.com", password: "password", role: 1, username: "Kris", country: "US")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)


    visit admin_profile_path
    click_link "Add Needs"

    fill_in "Name", with: "Cow"
    fill_in "Description", with: "Bovine Lactation"
    fill_in "Cost", with: "100"
    fill_in "Image Url", with: need_url1

    click_button "Create Need"

    visit admin_profile_path
    click_link "View All Needs"

    # within('tr', :text => 'Cow') do
      click_link "Edit"
    # end
# save_and_open_page

    fill_in "Name", with: "Cows"
    fill_in "Description", with: "Milk"
    fill_in "Cost", with: "1000"
    fill_in "Image Url", with: need_url2

    click_button "Update Need"

    expect(page).to have_content("Cow")
    expect(page).to have_content("Bovine Lactation")
    expect(page).to have_content("100")

  end
end
