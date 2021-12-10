module BalanceSheet
  class Generator
    def self.call(input_path:, output_path:)
      dataset = Parsers::Json.call(input_path)
      # ...
    end
  end
end
