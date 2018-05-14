class CommandLineParser
  def self.parse(args)
    options = {}
    parser = OptionParser.new do |opts|
      opts.on('-c', '--code code', 'Discount Code') do |code|
        options[:code] = code
      end

      opts.on('-i', '--outlet OUTLET', Numeric, 'Outlel id') do |outlet_id|
        options[:outlet_id] = outlet_id
      end

      opts.on('-o', '--output', 'Output file') do |file|
        options[:output] = file
      end

      opts.on('-h', '--help', 'Display Help') do
        puts opts
        exit
      end
    end
    parser.parse!(args.empty? ? ['-h'] : args)
    options
  end
end
