class Runner
	def initialize(options, products)
		@options = options
		@products = products
		@cart = Cart.new
	end

	def populate_cart
		products['cart_items'].each do |item|
			cart.add_item(Product.new(item))
		end
	end

	def init_discount_engine
		discount = DiscountEngine.new
		discount.calculate_discount(cart, options[:code], options[:outlet_id])
	end

	def output_type
		if options[:output]
			Fileout.new(options[:output])
		else
			Console.new
		end
	end

	def run
		populate_cart
		output = OutputDelegator.new(output_type)
		output.print(init_discount_engine)
	end

	private
	attr_reader :options, :products, :cart
end
