class Cart
	def initialize
		@cart_items ||= []
	end

	def add_item(item)
		@cart_items << item
		self
	end

	def items
		@cart_items
	end

	def cost
		items.inject(0){|sum, item| sum + (item.quantity * item.unit_cost) }
	end

	def size
		items.size
	end
end