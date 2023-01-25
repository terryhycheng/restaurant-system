require "restaurant_system"

describe RestaurantSystem do
  before(:each) do
    @restaurant_system = RestaurantSystem.new
    $stdout = StringIO.new
  end

  it "displays the menu of the restaurant" do
    dish1 = double :fake_dish, name: "Curry chicken with rice", price: 15
    dish2 = double :fake_dish, name: "Fish and Chips", price: 18
    menu = double :fake_menu
    formatter = double :fake_formatter
    expect(menu).to receive(:list).twice.and_return([dish1, dish2]).ordered
    expect(formatter).to receive(:format).with(dish1).and_return("- Curry chicken with rice: $15").ordered
    expect(formatter).to receive(:format).with(dish2).and_return("- Fish and Chips: $18").ordered

    @restaurant_system.show_menu(menu, formatter)
    $stdout.rewind
    
    expect($stdout.gets).to eq("Menu\n")
    expect($stdout.gets).to eq("------------\n")
    expect($stdout.gets).to eq("- Curry chicken with rice: $15\n")
    expect($stdout.gets).to eq("- Fish and Chips: $18\n")
  end
  
  it "prints out 'This list is empty.' when there is no items in the menu" do
    menu = double :fake_menu
    formatter = double :fake_formatter
    expect(menu).to receive(:list).and_return([]).ordered
    
    @restaurant_system.show_menu(menu, formatter) # => 'This list is empty.'
    $stdout.rewind

    expect($stdout.gets).to eq("Menu\n")
    expect($stdout.gets).to eq("------------\n")
    expect($stdout.gets).to eq("The menu is empty.\n")
  end

  it "prints out the cart with a grand total" do
    dish = double :fake_dish, id: "fake-id", name: "Curry chicken with rice", price: 15
    menu = double :fake_menu
    cart = double :fake_cart
    formatter = double :fake_formatter
    expect(menu).to receive(:select).with("fake-id").and_return(dish).ordered
    expect(cart).to receive(:add).with(dish).ordered
    expect(cart).to receive(:list).twice.and_return([dish]).ordered
    expect(formatter).to receive(:format).with(dish).and_return("- Curry chicken with rice: $15").ordered
    expect(cart).to receive(:price_total).and_return(15).ordered
    restaurant_system = RestaurantSystem.new
    restaurant_system.add_to_cart("fake-id", menu, cart)
    
    restaurant_system.show_cart(cart, formatter)
    $stdout.rewind

    expect($stdout.gets).to eq("Cart\n")
    expect($stdout.gets).to eq("------------\n")
    expect($stdout.gets).to eq("- Curry chicken with rice: $15\n")
    expect($stdout.gets).to eq("------------\n")
    expect($stdout.gets).to eq("Grand total : $15\n")
  end

  it "prints out a correct message when the cart is empty" do
    cart = double :fake_cart
    formatter = double :fake_formatter
    expect(cart).to receive(:list).and_return([]).ordered
    restaurant_system = RestaurantSystem.new
    
    restaurant_system.show_cart(cart, formatter)
    $stdout.rewind

    expect($stdout.gets).to eq("Cart\n")
    expect($stdout.gets).to eq("------------\n")
    expect($stdout.gets).to eq("The cart is empty.\n")
  end

  it "returns a message body when the message is successfully sent" do
    dish = double :fake_dish
    cart = double :fake_cart
    messager = double :fake_messager
    fake_time = Time.new(2023, 1, 25, 18, 20 ,0)
    expect(cart).to receive(:list).twice.and_return([dish])
    expect(messager).to receive(:send).with(cart.list, fake_time, "+447775599444").and_return("Thank you! Your order was placed and will be delivered before 18:15")
    expect(cart).to receive(:clear)
    restaurant_system = RestaurantSystem.new

    restaurant_system.confirm_order("+447775599444", fake_time, cart, messager)
    $stdout.rewind

    expect($stdout.gets).to eq("Thank you! Your order was placed and will be delivered before 18:15\n")
  end
end