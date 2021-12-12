module BalanceSheet
  module Renderers
    class Base
      def initialize(path:)
        @path = path
      end

      def call(data:); end
    end
  end
end
