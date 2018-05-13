class OutputDelegator
  def initialize(output)
    @output = output
  end
  
  def print(message)
    @output.write message
  end
end
