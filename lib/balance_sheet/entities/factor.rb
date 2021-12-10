module BalanceSheet
  module Entities
    Factor = Struct.new(:id, :description, :category_id, :unit1, :unit2, :co2, :ch4, :n2o, :co2b, :ch4b) do
      def full_unit
        [unit1, unit2].compact.join('.')
      end

      def total_value(qty1, qty2)
        [
          (total_co2(qty1, qty2) || 0),
          (total_ch4(qty1, qty2) || 0),
          (total_n2o(qty1, qty2) || 0)
        ].sum
      end

      def total_co2(qty1, qty2)
        return nil if co2.nil?

        co2 * (qty1 || 1) * (qty2 || 1)
      end

      def total_ch4(qty1, qty2)
        return nil if ch4.nil?

        ch4 * (qty1 || 1) * (qty2 || 1)
      end

      def total_n2o(qty1, qty2)
        return nil if n2o.nil?

        n2o * (qty1 || 1) * (qty2 || 1)
      end

      def total_co2b(qty1, qty2)
        return nil if co2b.nil?

        co2b * (qty1 || 1) * (qty2 || 1)
      end

      def total_ch4b(qty1, qty2)
        return nil if ch4b.nil?

        ch4b * (qty1 || 1) * (qty2 || 1)
      end
    end
  end
end
