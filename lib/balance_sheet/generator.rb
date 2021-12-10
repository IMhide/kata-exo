module BalanceSheet
  class Generator
    def self.call(input_path:, output_path:)
      dataset = Parsers::Json.new(input_path: input_path).call
      # ...
    end
  end
end
