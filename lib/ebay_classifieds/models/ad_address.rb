module EbayClassifieds
  module Models
    class AdAddress 
      attr_accessor(:street,:city,:state,:zip_code,:longitude,:latitude)
    
      def self.new_from_api_data(data)
        new(data)
      end
    end
  end
end