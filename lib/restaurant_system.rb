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
      puts "The menu is empty."
    else
      menu.list.each do |dish|
        puts formatter.format(dish)
      end
    end
  end

  def add_to_cart(id, menu = @menu, cart = @cart)
    cart.add(menu.select(id))
  end

  def show_cart(cart = @cart, formatter = @formatter)
    puts "Cart"
    puts "------------"
    if cart.list.empty?
      puts "The cart is empty."
    else
      cart.list.each do |dish|
        puts formatter.format(dish)
      end
      puts "------------"
      puts "Grand total : $#{cart.price_total}"
    end
  end

  def confirm_order(phone_num, time = Time.now, cart = @cart, messager = @messager)
    puts messager.send(cart.list, time, phone_num)
    cart.clear()
  end

  def add_dish_to_menu(dish, menu = @menu)
    menu.add(dish)
  end
end