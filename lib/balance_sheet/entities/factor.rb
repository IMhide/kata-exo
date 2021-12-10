module BalanceSheet
  module Entities
    Factor = Struct.new(:id, :description, :category_id, :unit1, :unit2, :co2, :ch4, :n2o, :co2b, :ch4b)
  end
end
