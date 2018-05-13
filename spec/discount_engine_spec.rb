require_relative "support/spec_helper"

describe DiscountEngine do
  before do
    cart_json = JSON.parse(File.read("src/cart_items.json"))
    @cart = Cart.new
    cart_json['cart_items'].each {|item| @cart.add_item(Product.new item) }
    @engine = DiscountEngine.new

  end

  it "Should get only one discount coupon" do
    @engine.get_coupon("BOX8LOVE").wont_be_nil
    @engine.get_coupon("BOX8LOVE").type.must_equal "Percentage"
    @engine.get_coupon("BOX8LOVE").code.must_equal "BOX8LOVE"
  end

  it "Should Calculate discount by percentage" do
    @engine.calculate_discount(@cart, "BOX8LOVE", 7)		
  end

  it "Should Calculate Flat Discount" do
    @engine.calculate_discount(@cart, "HELLOBOX8", 1)
  end

  it "Should Calculate Bogo Discount" do
    @engine.calculate_discount(@cart, "BOGO", 1)
  end

end
