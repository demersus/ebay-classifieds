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
      def call_api(verb,params = {})
        EbayClassifieds::ApiConnection.send(verb,api_endpoint,params)
      end
    end
  end
end