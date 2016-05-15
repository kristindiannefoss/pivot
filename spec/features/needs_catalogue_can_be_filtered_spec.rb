require "rails_helper"

feature "needs catalogue" do
  scenario "can be filtered by category", js: true do
    need = create(:need_type, name: "need 1", category: Category.find_or_create_by(name: "category 1"))
    need2 = create(:need_type, name: "need 2", category: Category.find_or_create_by(name: "category 2"))

    visit needs_path

    expect(page).to have_content("need 1")
    expect(page).to have_content("need 2")

    select "category 1", from: "need[filter_category]"

    save_and_open_page
    expect(page).to have_selector("#need-1", visible: true)
    expect(page).to_not have_content("need 2")
  end
end
