require 'rails_helper'

RSpec.describe NeedType, type: :model do
  context "before_validation" do
    it { is_expected.to callback(:assign_slug).before(:validation) }
  end

  context "validation" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:cost) }
    it { is_expected.to validate_presence_of(:image_url) }
  end

  it "generates a slug when it's created" do
    need  = create(:need, name: "Goats And Soda")

    expect(need.slug).to eq("goats-and-soda")
  end
end
