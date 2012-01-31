module EbayClassifieds
  module Resources
    class Category < Struct.new(:id,:name)
      def self.new_from_json2(json2)
        new(:id => json2['@id'],:name => json2['localized-name'])
      end      
    end
  end
end