class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def create_cart_needs
    contents.map do |id, qty|
      name = Need.find(id.to_i).name
      CartNeed.new(name, qty)
    end
  end

  def add_donation(donation)
    contents["donor"] ||= {}
    contents["donor"][donation.user_id] ||= []
    contents["donor"][donation.user_id] += [donation.id]
  end

  def add_need(need_id, need_max)
    contents[need_id.to_s] ||= 0
    if contents[need_id.to_s] < need_max
      contents[need_id.to_s] += 1
      "Successfully added to cart!"
    else
      "You can only request #{need_max} of that item."
    end
  end

  def count_donations
    contents["donor"].nil? ? 0 : contents["donor"].values.flatten.count
  end

  def count_needs
    contents["recipient"].values.sum
  end

  def count_of(need_id)
    contents[need_id.to_s]
  end

  def remove_need(need_id)
    contents.reject! { |id| id == need_id.to_s }
  end

  def update(need_id, qty)
    contents[need_id.to_s] = qty
  end

  def total_cost
    if contents.empty?
      return 0
    else
      mapped_values.map do |ci|
        ci.subtotal
      end.reduce(:+)
    end
  end
end
