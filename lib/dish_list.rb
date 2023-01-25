class DishList
  def initialize
    @list = []
  end

  def list
    return @list
  end

  def add(dish)
    @list << dish
  end

  def delete(id)
    @list.delete_if { |dish| dish.id == id }
  end

  def select(id)
    result = @list.select { |dish| dish.id == id }
    return result[0] || []
  end
end