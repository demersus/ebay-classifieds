require 'ebay_classifieds/paginated_collection'
require 'ebay_classifieds/api_connection'
module EbayClassifieds
  module Resource
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def api_endpoint(ep = nil)
        return @@api_endpoint unless ep
        @@api_endpoint = ep
      end
      def search(params = {})
        
      end
    end
  end
end