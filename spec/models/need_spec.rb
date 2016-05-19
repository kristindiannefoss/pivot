require 'rails_helper'

describe Need, type: :model do
  context "before_validation" do
    it { is_expected.to callback(:assign_slug).before(:validation) }
  end

  context "after_validation" do
    it { is_expected.to callback(:assign_total).after(:validation) }
  end

  context "belongs to" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category) }
  end

  context "validation" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:cost) }
    it { is_expected.to validate_presence_of(:raised) }
    it { is_expected.to validate_presence_of(:image_url) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:slug) }
    it { is_expected.to validate_presence_of(:max) }
  end

  it "generates a slug when it's created" do
    need = create(:need, name: "Goats And Soda")

    expect(need.slug).to eq("goats-and-soda")
  end

  it "can calculate total amount" do
    need = create(:need)

    expect(need.assign_total).to eq(need.total)
  end

end
