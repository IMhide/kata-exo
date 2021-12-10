require 'json'

module BalanceSheet
  module Parsers
    class Json < Base
      def call
        file_reader(@input_path)
      end

      private

      def file_reader(path)
        JSON.parser(File.read(path))
      end
    end
  end
end
