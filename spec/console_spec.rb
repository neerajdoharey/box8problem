require_relative "support/spec_helper"

describe Console do
	it "Should print to Console" do
		out, err = capture_io do
			Console.new().print("Hello")
		end

		out.must_equal "Hello\n"
	end
end