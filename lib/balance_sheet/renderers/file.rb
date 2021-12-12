module BalanceSheet
  module Renderers
    class File < Base
      def call(data:)
        ::File.write(@path, data)
      end
    end
  end
end
