require 'ebay_classifieds/resources/ad_attribute'
module EbayClassifieds
  module Resources
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
      
      def method_missing(name,args)
        attr = @raw_attributes[name.replace('=','')]
        return nil unless attr
        if name.ends_with?('=') 
          attr.value = args
        else
          attr.value 
        end
      end
    end
  end
end