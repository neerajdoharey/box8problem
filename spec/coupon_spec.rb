require_relative "support/spec_helper"

describe Coupons do
  before do
    @json = JSON.parse('{
      "id": 1,
      "code": "BOX8LOVE",
      "type": "Percentage",
      "value": 10,
      "cashback_value": 0,
      "start_date": "2015-07-01",
      "end_date": "2019-12-31",
      "active": true,
      "applicable_outlet_ids": [1, 2, 3, 4, 5, 6],
      "minimum_delivery_amount_after_discount": 150,
      "maximum_discount": 200
    }')
  end

  it "Should create queriable Percentage discount coupon objects" do
    coupon = Coupons.create(@json)
    coupon.must_respond_to(:id)
    coupon.must_respond_to(:type)
    coupon.must_respond_to(:code)
    coupon.must_respond_to(:active)
  end
end
