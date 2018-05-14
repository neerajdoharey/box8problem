class Fileout
  def initialize(file_name)
    @file_name = file_name
  end

  def write(message)
    File.open(@file_name, 'w') do |file|
      file.write(message)
    end
  end
end
