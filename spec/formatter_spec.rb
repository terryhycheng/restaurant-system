require "formatter"

describe Formatter do
  it "returns a string in correct format" do
    dish = double :fake_dish, name: "Curry chicken with rice", price: 15
    formatter = Formatter.new
    expect(formatter.format(dish)).to eq "- Curry chicken with rice: $15"
  end
end