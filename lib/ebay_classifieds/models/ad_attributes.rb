module EbayClassifieds
  module Models
    class AdAttributes
      attr_reader :raw_attributes
      def initialize(data)
        @raw_attributes = {}
        data.each do |attr|
          @raw_attributes[attr['localized_label']] = AdAttribute.new(attr)
        end
      end
      
      def self.new_from_api_data(data)
        new(data)
      end
      
      def [](attr_name)
        attr = @raw_attributes[attr_name]
        return nil unless attr
        attr.value
      end
    end
  end
end