require "rails_helper"

feature "Admin can create Recipient needs" do
  scenario "as a global admin" do
    # admin = User.create(first_name: "Kris", last_name: "Foss", email: "kris.foss@gmail.com", password: "password", role: 1, username: "Kris", country: "US")
    # recipient = User.create(first_name: "Harry", last_name: "Potter", email: "potter@gmail.com", password: "password", role: 2, username: "HarryP", country: "UK")
    # category = Category.create(name: "animals")

    admin = create(:user, role: 1, )
    recipient = create(:user, role: 2, username: "HarryP")
    category = create(:category, name: "animals")

    need = category.needs.create(name: "Cow",
                           description: "Bovine Lactation",
                           cost: 46,
                           image_url: "auto_maintenance.png",
                           slug: "auto-maintenance",
                           quantity: 1,
                           category_id: 1)


    need2 = category.needs.create(name: "Sheep",
                            description: "For Wool and Hugs",
                            cost: 46,
                            image_url: "sheep.png",
                            slug: "sheep",
                            quantity: 1,
                            category_id: 1)

                            recipient.needs = [need]

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    #Background: One admin user, one recipient "Jon" with 2 needs "cow", "sheep"
    #as an admin
    #when I visit "/", (where does this recipient list link live?)MANAGE RECIPIENTS link in admin nav
    #and I click on "Manage Recipients"
    #I expect to be on admin/recipients
    #and I click on recipient name
    #I expect to be on admin/recipients/slug    (admin/recipients/jon)
    #I would expect to see both "cow : 1", and "sheep : 1"

    visit root_path
    click_link "Manage Recipients"

    expect(current_path).to eq("/admin/recipients")

    click_link recipient.full_name

    expect(page).to have_content("Cow")
    expect(page).to_not have_content("Sheep")

    click_on "Add New Needs"

    expect(current_path).to eq("admin/recipients/harryp/needs")

    within ".sheep" do    #name div after the slug instead of name
      click_on "Add Need To Recipient"
    end

    expect(page).to have_content("Sheep")
    expect(page).to have_content("Cow")
  end
end
