require 'rails_helper'

describe Cart do
  let(:success) { "Successfully added to cart!" }

  it "can add one need_type to cart" do
    need_type = create(:need_type)
    cart = Cart.new({})

    expect(cart.add_need(need_type.id, need_type.max)).to eq(success)
  end

  it "cannot add more than the max allowable quantity" do
    need_type = create(:need_type, max: 2)
    cart = Cart.new({})
    failure = "You can only request #{need_type.max} of that item."

    need_type.max.times do
      expect(cart.add_need(need_type.id, need_type.max)).to eq(success)
    end

    expect(cart.add_need(need_type.id, need_type.max)).to eq(failure)
  end

  it "can return a total count for need_types in thecart" do
    need_type1, need_type2 = create_list(:need_type, 2)
    cart =  Cart.new({})
    cart.add_need(need_type1.id, need_type1.max)

    expect(cart.count_all).to eq(1)

    cart.add_need(need_type2.id, need_type2.max)

    expect(cart.count_all).to eq(2)
  end

  it "can remove need_type from the cart" do
    need_type1, need_type2 = create_list(:need_type, 2)
    cart =  Cart.new({})

    expect(cart.count_all).to eq(0)

    cart.add_need(need_type1.id, need_type1.max)
    cart.add_need(need_type2.id, need_type2.max)

    expect(cart.count_all).to eq(2)

    cart.remove_need(need_type1.id)

    expect(cart.count_all).to eq(1)
  end
end
