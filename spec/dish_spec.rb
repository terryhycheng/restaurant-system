require "dish"

describe Dish do
  before(:each) do
    @dish = Dish.new("Curry chicken with rice", 15, "2d931510-d99f-494a-8c67-87feb05e1594")
  end

  it "returns the dish ID" do
    expect(@dish.id).to eq "2d931510-d99f-494a-8c67-87feb05e1594"
  end

  it "returns the name of the dish" do
    expect(@dish.name).to eq "Curry chicken with rice"
  end

  it "returns the price of the dish" do
    expect(@dish.price).to eq 15
  end

  it "returns true when the Dish object is initialised" do
    expect(@dish.available?).to be true
  end

  it "returns false when the dish is off the dish list" do
    @dish.off_list()
    expect(@dish.available?).to be false
  end
  
  it "returns true when the dish is push back to the list" do
    @dish.off_list()
    @dish.on_list()
    expect(@dish.available?).to be true
    
  end
end