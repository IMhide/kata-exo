module BalanceSheet
  module Entities
    Factor = Struct.new(:id, :description, :category_id, :unit1, :unit2, :co2, :ch4, :n2o, :co2b, :ch4b) do
      def full_unit
        [unit1, unit2].compact.join('.')
      end

      def total_value(qty1, qty2)
        [total_co2(qty1, qty2), total_ch4(qty1, qty2), total_n2o(qty1, qty2)].sum
      end

      def total_co2(qty1, qty2)
        (co2 || 0) * (qty1 || 1) * (qty2 || 1)
      end

      def total_ch4(qty1, qty2)
        (ch4 || 0) * (qty1 || 1) * (qty2 || 1)
      end

      def total_n2o(qty1, qty2)
        (n2o || 0) * (qty1 || 1) * (qty2 || 1)
      end

      def total_co2b(qty1, qty2)
        (co2b || 0) * (qty1 || 1) * (qty2 || 1)
      end

      def total_ch4b(qty1, qty2)
        (ch4b || 0) * (qty1 || 1) * (qty2 || 1)
      end
    end
  end
end
