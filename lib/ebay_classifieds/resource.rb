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
      def find(id)
        resp = api.get("#{api_endpoint}/#{id}")
        new_from_api_data(resp)
      end
      protected
      def call_api(verb,params = {})
        api.send(verb,api_endpoint + '?' + URI.encode_www_form(params))
      end
      def api
        EbayClassifieds::ApiConnection
      end
    end
  end
end