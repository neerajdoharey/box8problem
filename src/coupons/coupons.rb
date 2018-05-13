class Coupons
	CPN_APPLD = "Coupon Applied"
	CPN_NOT_APPLD = "Coupon not applicable"
	ZERO_DISCOUNT = 0
	attr_reader :total_cost

	def self.create(json)
		self.class_eval{ attr_accessor *json.keys }
		new
	end

	def apply(total_cost)
		@total_cost = total_cost
		message(max_discount, cashback_value)
	end

	def max_discount
		if valid_discount?
			maximum_discount_apply
		else
			ZERO_DISCOUNT
		end
	end

	def message(max_discount, cashback_value)
		valid, message = coupon_applicable(max_discount)
		Hash[valid: valid, message: message , discount: max_discount, cashback_value: cashback_value]
	end

	def coupon_applicable(max_discount)
		if max_discount > ZERO_DISCOUNT
			[true, CPN_APPLD]
		else
			[false, CPN_NOT_APPLD]
		end
	end

	def valid_discount?
		discounted_amount >= minimum_delivery_amount_after_discount
	end

	def maximum_discount_apply
		discount < maximum_discount ? discount : maximum_discount
	end

	def discounted_amount
		total_cost - discount		
	end
end