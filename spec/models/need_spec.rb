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
  end

  it "generates a slug when it's created" do
    need = create(:need, name: "Goats And Soda")

    expect(need.slug).to eq("goats-and-soda")
  end

  it "generates the total when it's created" do
    need = create(:need, cost: 5, quantity: 4)

    expect(need.total).to eq(20)
  end
end
