require 'rails_helper'

RSpec.describe User, type: :model do
  context "has many associations" do
    it { is_expected.to have_many(:donations) }
    it { is_expected.to have_many(:needs) }
  end

  context "validation" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }
    it { is_expected.to validate_presence_of(:country) }
  end

  context "user's role" do
    it { is_expected.to define_enum_for(:role) }
  end

  context "has secure password" do
    it { is_expected.to have_secure_password }
  end

  it "can add total cost" do
    need1 = create(:need, cost: 10, quantity: 1)
    need2 = create(:need, cost: 10, quantity: 1)
    user = create(:user)
    user.needs << [need1, need2]

    expect(user.total).to eq(20)
  end

  it "can add raised amount" do
    need1 = create(:need, raised: 8)
    need2 = create(:need, raised: 9)
    user = create(:user)
    user.needs << [need1, need2]

    expect(user.raised).to eq(17)
  end
end
