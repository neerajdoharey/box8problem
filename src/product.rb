class Product
  attr_reader :product_id, :quantity, :unit_cost

  def initialize(json)
    @product_id = json["product_id"]
    @quantity = json["quantity"]
    @unit_cost = json["unit_cost"]
  end
end
