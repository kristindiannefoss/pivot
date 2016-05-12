class CartNeed < SimpleDelegator
  attr_reader :need, :quantity

  def initialize(id, qty)
    @need = Need.find_by(id: id)
    @quantity = qty
    super(@need)
  end

  def subtotal
    need.price * quantity
  end
end
