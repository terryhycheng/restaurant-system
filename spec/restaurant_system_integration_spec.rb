require "dotenv"
require "dish"
require "dish_list"
require "cart"
require "formatter"
require "messager"
require "restaurant_system"

describe "Restaurant System Integration Test" do
  before(:each) do
    @restaurant_system = RestaurantSystem.new
    $stdout = StringIO.new
    Dotenv.load
  end

  it "adds dish to menu" do
    dish = Dish.new("Curry chicken with rice", 15)
    @restaurant_system.add_dish_to_menu(dish)

    @restaurant_system.show_menu()
    $stdout.rewind

    expect($stdout.gets).to eq("Menu\n")
    expect($stdout.gets).to eq("------------\n")
    expect($stdout.gets).to eq("- Curry chicken with rice: $15\n")
  end

  it "displays the menu of the restaurant" do
    dish1 = Dish.new("Curry chicken with rice", 15)
    dish2 = Dish.new("Fish and Chips",18)
    @restaurant_system.add_dish_to_menu(dish1)
    @restaurant_system.add_dish_to_menu(dish2)

    @restaurant_system.show_menu()
    $stdout.rewind
    
    expect($stdout.gets).to eq("Menu\n")
    expect($stdout.gets).to eq("------------\n")
    expect($stdout.gets).to eq("- Curry chicken with rice: $15\n")
    expect($stdout.gets).to eq("- Fish and Chips: $18\n")
  end
  
  it "prints out 'This list is empty.' when there is no items in the menu" do
    @restaurant_system.show_menu()
    $stdout.rewind

    expect($stdout.gets).to eq("Menu\n")
    expect($stdout.gets).to eq("------------\n")
    expect($stdout.gets).to eq("The menu is empty.\n")
  end

  it "prints out the cart with a grand total" do
    dish = Dish.new("Curry chicken with rice", 15)
    
    @restaurant_system.add_dish_to_menu(dish)
    @restaurant_system.add_to_cart(dish.id)
    
    @restaurant_system.show_cart()
    $stdout.rewind

    expect($stdout.gets).to eq("Cart\n")
    expect($stdout.gets).to eq("------------\n")
    expect($stdout.gets).to eq("- Curry chicken with rice: $15\n")
    expect($stdout.gets).to eq("------------\n")
    expect($stdout.gets).to eq("Grand total : $15\n")
  end

  it "prints out a correct message when the cart is empty" do
    @restaurant_system.show_cart()
    $stdout.rewind

    expect($stdout.gets).to eq("Cart\n")
    expect($stdout.gets).to eq("------------\n")
    expect($stdout.gets).to eq("The cart is empty.\n")
  end

  it "returns a message body when the message is successfully sent" do
    dish = Dish.new("Curry chicken with rice", 15)
    fake_time = Time.new(2023, 1, 25, 18, 05, 0)

    @restaurant_system.add_dish_to_menu(dish)
    @restaurant_system.add_to_cart(dish.id)

    @restaurant_system.confirm_order(ENV["TEST_PHONE_NUM"], fake_time)
    $stdout.rewind

    expect($stdout.gets).to eq("Thank you! Your order was placed and will be delivered before 18:15\n")
  end
end