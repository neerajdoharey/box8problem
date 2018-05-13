class OutputDelegator
	def initialize(output)
		@output = output
	end
	
	def print(message)
		@output.print message
	end
end