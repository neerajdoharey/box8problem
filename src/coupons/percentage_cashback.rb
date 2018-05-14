class PercentageCashback < Coupons
  def discount
    total_cost * value / 100
  end
end
