require "dish_list"

describe DishList do
  before(:each) do
    @dish_list = DishList.new
    @dish = double :fake_dish, id: "fake-id"
  end

  it "adds a Dish object to the list" do
    @dish_list.add(@dish)
    expect(@dish_list.list()).to eq [@dish]
  end

  it "returns an empty list when no dish is in the list" do
    expect(@dish_list.list()).to eq []
  end

  it "selects and returns a dish with certain ID" do
    @dish_list.add(@dish)
    expect(@dish_list.select("fake-id")).to eq @dish
  end
  
  it "deletes a dish with certain ID" do
    @dish_list.add(@dish)
    @dish_list.delete("fake-id")
    expect(@dish_list.list()).to eq []
  end
  
  it "returns an empty array when the user selects by an invalid ID" do
    @dish_list.add(@dish)
    expect(@dish_list.select("wrong-id")).to eq []
  end
  
  it "changes nothing when the user deletes by an invalid ID" do
    @dish_list.add(@dish)
    @dish_list.delete("wrong-id")
    expect(@dish_list.list).to eq [@dish]
  end

end