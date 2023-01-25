require "messager"

describe Messager do
  it "returns 'accepted' if the message is successfully sent" do
    dish = double :fake_dish
    cart = double :fake_cart
    fake_time = Time.new(2023, 1, 25, 18, 20 ,0)
    expect(cart).to receive(:list).and_return([dish, dish])
    messager = Messager.new
    expect(messager.send(cart.list, fake_time)).to eq "Thank you! Your order was placed and will be delivered before 18:40"
  end
end