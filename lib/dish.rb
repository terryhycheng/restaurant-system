require 'securerandom'

class Dish
  def initialize(name, price, id = SecureRandom.uuid) # name is a string, price is an integer
    @name = name
    @id = id
    @price = price
    @isAvailable = true
  end

  def id
    return @id
  end

  def name
    return @name
  end

  def price
    return @price
  end

  def available?
    return @isAvailable
  end

  def on_list
    @isAvailable = true
  end

  def off_list
    @isAvailable = false
  end
end