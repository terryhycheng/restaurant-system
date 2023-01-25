class DishList
  def initialize
    @list = []
  end

  def list
    return @list
  end

  def add(dish) # dish is an instance of Dish
    @list << dish
  end

  def delete(id) # id is a string
    @list.delete_if { |dish| dish.id == id }
  end

  def select(id) # id is a string
    result = @list.select { |dish| dish.id == id }
    return result[0] || []
  end
end