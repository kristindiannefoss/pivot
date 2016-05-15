require 'rails_helper'

describe Category, type: :model do
  context "belongs to" do
    it { is_expected.to have_many(:needs) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
