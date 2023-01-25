class Cart
  def initialize
    @cart = []
  end

  def list
    return @cart
  end

  def add(dish)
    @cart << dish
  end

  def price_total
    total = 0
    @cart.each do |dish|
      total += dish.price
    end
    return total
  end

  def remove_dish(id)
    @cart.delete_if { |dish| dish.id == id }
  end

  def clear
    @cart = []
  end
end