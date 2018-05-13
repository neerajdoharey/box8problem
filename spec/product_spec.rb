require_relative "support/spec_helper"

describe Product do
  before do 
    @json = JSON.parse('{
        "product_id": 1,
        "quantity": 1,
        "unit_cost": 100
      }')
  end

  it "Should take a json object and create a product" do
    product = Product.new(@json)
    product.product_id.must_equal 1
    product.quantity.must_equal 1
    product.unit_cost.must_equal 100
  end
end
