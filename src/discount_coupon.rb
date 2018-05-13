class DiscountCoupon
  def initialize(uri)
    @uri = uri
    @coupons ||= []
  end

  def has_valid_uri?
    URI(@uri).kind_of?(URI::HTTP)||URI(@uri).kind_of?(URI::HTTPS)
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

  def method_missing(meth_name, *args, &block)
    attr = meth_name.to_s.gsub(/find_coupon_by_/,'').intern
    coupon_codes.find{|i| i.send(attr) == args.first}
  end

  private
  def add_coupons coupon
    @coupons << coupon
  end

  def generate_coupons json
    json['coupon_codes'].each do |coupon|
      c = Object.const_get(coupon["type"].gsub(/[&]/,'')).create(coupon)
      coupon.each{|i,j| c.send("#{i}=", j)}
      add_coupons(c) 
    end
  end
end
