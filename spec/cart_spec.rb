require_relative "support/spec_helper"

describe Cart do
	before do
		@json = JSON.parse(File.read("src/cart_items.json"))
	end

	it "Should be able to add items into the cart" do
		cart = Cart.new
		cart.must_respond_to :add_item
		cart.add_item(Product.new(@json['cart_items'].first)).items.size.must_be :>=, 1
	end

	it "Should be able to return items from the cart" do
		cart = Cart.new
		cart.items.must_be_instance_of Array
		cart.add_item(Product.new(@json['cart_items'].first))
		cart.items.first.must_be_instance_of Product
	end
end