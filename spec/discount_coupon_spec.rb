require_relative "support/spec_helper"

def discount_coupon 
  uri = YAML.load_file("config/discount.yml")[:uri]
  @discount_coupon ||= DiscountCoupon.new(uri).fetch
end

describe DiscountCoupon do
  it "Should be an instance of DiscountCoupon" do
    discount_coupon.must_be_instance_of DiscountCoupon
  end

  it "Must return an error object when initialized with a wrong url" do 
    DiscountCoupon.new("abcde").has_valid_uri?.must_equal false
  end

  it "Must fetch the discount coupons from the Url" do
    discount_coupon.coupon_codes.length.must_be :>=, 1
  end

  it "Must be able to find product by attributes" do
    discount_coupon.find_coupon_by_id 1
    discount_coupon.find_coupon_by_type "Discount" 
  end
end
