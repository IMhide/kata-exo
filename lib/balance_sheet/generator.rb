module BalanceSheet
  class Generator
    def self.call(input_path:, serializer: Serializers::Json, rederer: Renderers::File.new(path: 'data/output.json'))
      dataset = Parsers::Json.new(input_path: input_path).call
      formated_data = serializer.new(dataset: dataset).call
      rederer.call(data: formated_data)

      # ...
    end
  end
end
