require 'rails_helper'

describe NeedType, type: :model do
  context "before_validation" do
    it { is_expected.to callback(:assign_slug).before(:validation) }
  end

  context "belongs to association" do
    it { is_expected.to belong_to(:category) }
  end

  context "validation" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:cost) }
    it { is_expected.to validate_presence_of(:image_url) }
    it { is_expected.to validate_presence_of(:slug) }
    it { is_expected.to validate_presence_of(:max) }
  end

  it "generates a slug when it's created" do
    need = create(:need, name: "Goats and Soda")

    expect(need.slug).to eq("goats-and-soda")
  end
end
