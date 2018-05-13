class Discount < Coupons
  def discount
    total_cost - value
  end
end
