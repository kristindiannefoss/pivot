require 'rails_helper'

describe Donation, type: :model do
  context "belongs to" do
    it { is_expected.to belong_to(:need) }
    it { is_expected.to belong_to(:user) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:need_name) }
    it { is_expected.to validate_presence_of(:need_slug) }
    it { is_expected.to validate_presence_of(:recipient_id) }
    it { is_expected.to validate_presence_of(:need_id) }
  end
end
