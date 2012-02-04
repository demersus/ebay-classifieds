module EbayClassifieds
  module ApiResource
    def self.included(base)
      base.extend ClassMethods
    end
    module ClassMethods
      
      def api_path(ep = nil)
        return @@api_path unless ep
        @@api_path = ep
      end
      def api_path_join(a,b = nil)
        path = api_path
        params = b
        if a.is_a? String
          path = a.start_with?('/') ? "#{api_path}#{a}" : "#{api_path}/#{a}"
        elsif a.is_a? Hash
          params = a           
        end
        return params ? [path,URI.encode_www_form(params)].compact.join('?') : path 
      end
      protected
      
      def api
        EbayClassifieds::ApiConnection
      end
    end
  end
end