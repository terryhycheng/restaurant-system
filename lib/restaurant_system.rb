require "dish_list"
require "cart"
require "formatter"
require "messager"

class RestaurantSystem
  def initialize
    @menu = DishList.new
    @cart = Cart.new
    @formatter = Formatter.new
    @messager = Messager.new
  end

  def show_menu(menu = @menu, formatter = @formatter)
    puts "Menu"
    puts "------------"
    if menu.list.empty?
      puts "This list is empty."
    else
      menu.list.each do |dish|
        puts formatter.format(dish)
      end
    end
  end

  def add_to_cart(menu = @menu, cart = @cart, id) # instances of DishList & Cart, id is a string
    # selects a dish and adds it to the cart
    # => void
  end

  def show_cart(cart = @cart, formatter = @formatter) # instances of Cart & Formatter
    # prints out all items in the cart
    # => void
  end

  def confirm_order(cart = @cart, messager = @messager) # instances of Cart & Messager
    # confirms an order by sending a message to customer
    # => void
  end
end