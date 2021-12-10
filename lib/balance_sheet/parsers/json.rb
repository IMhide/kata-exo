require 'json'

module BalanceSheet
  module Parsers
    class Json < Base
      def call
        hash_data = file_reader(@input_path)
        hash_data.map do |(key, value)|
          value.map do |data|
            ENTITIES_DICTIONARY[key.to_sym].new(*data.values)
          end
        end.flatten
      end

      private

      def file_reader(path)
        JSON.parse(File.read(path))
      end
    end
  end
end
