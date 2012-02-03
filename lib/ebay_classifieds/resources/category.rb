module EbayClassifieds
  module Resources
    class Category < Struct.new(:id,:name)
      def self.new_from_api_data(data)
        new(data)
      end     
    end
  end
end