module EbayClassifieds
  module ApiResource
    def self.included(base)
      base.extend ClassMethods
    end
    module ClassMethods
      
      def api_path(ep = nil)
        return @api_path unless ep
        @api_path = ep
      end
      def api_format(f = nil)
        return @api_format unless f
        @api_format = f
      end
      def api_path_join(a = {},b = nil)
        path = api_path
        params = b
        if a.is_a? String
          path = a.start_with?('/') ? "#{path}#{a}" : "#{api_path}/#{a}"
        elsif a.is_a? Hash
          params = a           
        end
        path = [path,api_format].compact.join('.')  
        return params ? [path,URI.encode_www_form(params)].compact.join('?') : path 
      end
      protected
      
      def api_get(*args)
        resp = EbayClassifieds::ApiConnection.get(*args)
        raise Exceptions::HttpError.new(resp) unless resp.code < 400
        resp
      end
    end
  end
end