module EbayClassifieds
  module Resources
    class AdAddress < Struct.new(:street,:city,:state,:zip_code,:longitude,:latitude)
    
      def self.new_from_api_data(data)
        new(data)
      end
    end
  end
end