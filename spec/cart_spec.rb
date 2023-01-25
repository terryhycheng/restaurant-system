require "cart"

describe Cart do
  before(:each) do
    @cart = Cart.new
  end

  it "adds a dish into the cart" do
    dish = double :fake_dish
    @cart.add(dish)
    expect(@cart.list()).to eq [dish]
  end

  it "returns an empty array when there is no itmes in the cart" do
    expect(@cart.list()).to eq []
  end

  it "calculate the total price of all items in the cart" do
    dish = double :fake_dish, price: 15
    @cart.add(dish)
    @cart.add(dish)
    expect(@cart.price_total()).to eq 30
  end

  it "removes a dish from the cart" do
    dish = double :fake_dish, id: "fake-id"
    @cart.add(dish)
    @cart.remove_dish("fake-id")
    expect(@cart.list).to eq []
  end

  it "remains unchanged when the users enters an invalid id" do
    dish = double :fake_dish, id: "fake-id"
    @cart.add(dish)
    @cart.remove_dish("wrong-id")
    expect(@cart.list()).to eq [dish]
  end

  it "clears the cart" do
    dish = double :fake_dish
    @cart.add(dish)
    @cart.add(dish)
    @cart.clear
    expect(@cart.list()).to eq []
  end
end