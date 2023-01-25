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
    expect($stdout.gets).to eq("This list is empty.\n")
  end
end