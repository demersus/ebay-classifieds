module EbayClassifieds
  module Models
    class Category
      attr_accessor(:id,:name)
      include AttributeInitializer
      def self.new_from_api_data(data)
        new(:id => data['id'],:name => data['localized_name'])
      end     
    end
  end
end