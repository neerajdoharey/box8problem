class Bogo < Coupons
	def apply(cart, total_cost)
		@cart = cart
		@total_cost = total_cost
		message(max_discount, cashback_value)
	end

	def discount
		return 0 if cart.size <= 1
		return select_discount_stretagy if cart.size == 2
	end

	def select_discount_stretagy
		if cart.items.first.quantity == cart.items.last.quantity 
			lowest_cost
		else
			lowest_product_cost
		end
	end

	private
	def lowest_cost
		cart.items.map{|item| item.quantity * item.unit_cost }.min
	end

	def lowest_product_cost
		cart.items.map {|i| i.unit_cost * pairs }.min
	end

	def pairs
		cart.items.map{|i| i.quantity }.min
	end
 
	attr_reader :cart
end