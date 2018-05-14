class DiscountCoupon
  def initialize(uri)
    @uri = uri
    @coupons ||= []
  end

  def valid_uri?
    URI(@uri).is_a?(URI::HTTP) || URI(@uri).is_a?(URI::HTTPS)
  end

  def fetch
    uri = URI(@uri)
    response = Net::HTTP.get(uri)
    generate_coupons(JSON.parse(response))
    self
  end

  def coupon_codes
    @coupons
  end

  def method_missing(meth_name, *args)
    if meth_name.to_s =~ /find_coupon_by_(.*)/
      attr = meth_name.to_s.gsub(/find_coupon_by_/, '').intern
      coupon_codes.find { |i| i.send(attr) == args.first }
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?('find_coupon_by_') || super
  end

  private

  def add_coupons(coupon)
    @coupons << coupon
  end

  def generate_coupons(json)
    json['coupon_codes'].each do |coupon|
      c = Object.const_get(coupon['type'].gsub(/[&]/, '')).create(coupon)
      coupon.each { |i, j| c.send("#{i}=", j) }
      add_coupons(c)
    end
  end
end
