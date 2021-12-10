require 'json'

module BalanceSheet
  module Serializers
    class Json < Base
      def call
        super.to_json
      end
    end
  end
end
