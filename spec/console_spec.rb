require_relative 'support/spec_helper'

describe Console do
  it 'Should print to Console' do
    out, _err = capture_io do
      console = Console.new
      console.write('Hello')
    end

    out.must_equal 'Hello'
  end
end
