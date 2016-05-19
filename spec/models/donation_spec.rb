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

  it "can change it's status" do
    need = create(:need)
    donor = create(:user, role: 0)
    recipient = create(:user, role: 2)
    donation = donor.donations.create(status: "pending", amount: 10, need_name: need.name, need_slug: need.slug, recipient_id: recipient.id, need_id: need.id)

    donor.donations.set_status_complete(donation.id)

    expect(Donation.find(donation.id).status).to eq("completed")
  end

  it "raises raised amounts" do
    donor = create(:user, role: 0)
    recipient = create(:user, role: 2)
    need = create(:need, raised: 10, total: 20)
    recipient.needs = [need]
    donor.donations.create(status: "pending", amount: 5, need_name: need.name, need_slug: need.slug, recipient_id: recipient.id, need_id: need.id)

    donor.donations.send_to_recipients

    expect(Need.find(need.id).raised).to eq(15)
  end
end
