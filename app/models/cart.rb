class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def create_cart_needs
    contents["recipient"].map do |id, qty|
      name = NeedType.find(id.to_i).name
      CartNeed.new(name, qty)
    end
  end

  def add_donation(donation)
    contents["donor"] ||= {}
    contents["donor"][donation.recipient_id.to_s] ||= []
    contents["donor"][donation.recipient_id.to_s] += [donation.id]
  end

  def add_need(need_id, need_max)
    contents["recipient"] ||= {}
    contents["recipient"][need_id.to_s] ||= 0
    if contents["recipient"][need_id.to_s] < need_max
      contents["recipient"][need_id.to_s] += 1
      "Successfully added to cart!"
    else
      "You can only request #{need_max} of that item."
    end
  end

  def count_donations
    contents["donor"].nil? ? 0 : contents["donor"].values.flatten.count
  end

  def count_needs
    contents["recipient"].nil? ? 0 : contents["recipient"].values.sum
  end

  def count_of(need_id)
    contents[need_id.to_s]
  end

  def remove_need(need_id)
    contents["recipient"].reject! { |id| id == need_id.to_s }
  end

  def update(need_id, qty)
    contents[need_id.to_s] = qty
  end

  def total_recipient_cost
    if contents["recipient"].empty?
      return 0
    else
      contents["recipient"].map do |key, val|
        NeedType.find(key.to_i).cost * val
      end.reduce(:+)
    end
  end
end
