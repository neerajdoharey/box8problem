require_relative "support/spec_helper"
require 'tempfile'

describe Fileout do
	it "Should write to a file" do
		file = Tempfile.new("output")
		Fileout.new(file).print("Quick Brown Fox")

		File.read(file).must_equal "Quick Brown Fox"
	end
end