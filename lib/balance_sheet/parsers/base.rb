module BalanceSheet
  module Parsers
    class Base
      ENTITIES_DICTIONARY = {
        emission_categories: BalanceSheet::Entities::Category,
        emission_factors: BalanceSheet::Entities::Factor,
        activity_data: BalanceSheet::Entities::ActivityDatum,
        sites: BalanceSheet::Entities::Site
      }

      def initialize(input_path:)
        @input_path = input_path
      end

      def call; end
    end
  end
end
