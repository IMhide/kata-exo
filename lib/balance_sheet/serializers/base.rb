module BalanceSheet
  module Serializers
    class Base
      def initialize(dataset:)
        @dataset = dataset
      end

      def call
        sites.each_with_object({}) do |site, hash|
          hash[site.name] = emissions_for(site_id: site.id)
        end
      end

      protected

      def emissions_for(site_id:)
        emissions = activity_for(site_id: site_id).group_by { |a| a[:category_id] }

        emissions.keys.each_with_object({}) do |key, value|
          category = categories.find { |cat| cat.id == key }
          value[category.name] = {
            total_value: sum_emissions(emissions[key]),
            emissions: emissions[key].map { |e| e.except(:category_id) }
          }
        end
      end

      def activity_for(site_id:)
        find_activity_data_for(site_id: site_id).map do |datum|
          find_factor(datum.factor_id).balance_sheet_format(datum.qty1, datum.qty2)
                                      .merge({ activity_datum_id: datum.id })
        end
      end

      def find_activity_data_for(site_id:)
        @dataset.select do |datum|
          datum.instance_of?(BalanceSheet::Entities::ActivityDatum) && datum.site_id == site_id
        end
      end

      def find_factor(id)
        @dataset.find { |datum| datum.instance_of?(BalanceSheet::Entities::Factor) && datum.id == id }
      end

      def categories
        @categories ||= @dataset.select { |datum| datum.instance_of?(BalanceSheet::Entities::Category) }
      end

      def sites
        @sites ||= @dataset.select { |datum| datum.instance_of?(BalanceSheet::Entities::Site) }
      end

      def sum_emissions(emissions)
        emissions.reduce(0) { |sum, e| sum + e[:total_value] }
      end
    end
  end
end
