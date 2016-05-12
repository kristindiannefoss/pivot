class CartNeed < SimpleDelegator
  attr_reader :need, :quantity

  def initialize(name, qty)
    @need = NeedType.find_by(name: name)
    @quantity = qty
    super(@need)
  end

  def subtotal
    need.cost * quantity
  end
end
