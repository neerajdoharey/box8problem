class DiscountEngine
  URI = 'config/discount.yml'.freeze

  def calculate_discount(cart, discount_code, outlet_id)
    @cart = cart
    @coupon = get_coupon(discount_code)

    if coupon_applicable? && applicable_to_outlet?(outlet_id)
      applicable_coupon
    else
      coupon.message(0, coupon.cashback_value)
    end
  end

  def applicable_coupon
    case coupon
    when Bogo then apply_bogo_discount
    else apply_discount
    end
  end

  def get_coupon(code)
    uri = YAML.load_file(URI)[:uri]
    coupons = DiscountCoupon.new(uri).fetch
    coupons.find_coupon_by_code(code)
  end
  
  def apply_discount
    coupon.apply(cost_of_cart)
  end

  def cost_of_cart
    cart.cost
  end

  def date_valid?
    (start_date..end_date).cover?(Date.today)
  end

  def start_date
    Date.parse(coupon.start_date)
  end

  def end_date
    Date.parse(coupon.end_date)
  end

  def coupon_applicable?
    active_coupon? && date_valid?
  end

  def active_coupon?
    coupon.active
  end

  def applicable_to_outlet?(outlet_id)
    !coupon.applicable_outlet_ids.include?(outlet_id)
  end

  def apply_bogo_discount
    coupon.apply(cart, cost_of_cart)
  end

  private

  attr_reader :coupon, :cart
end
