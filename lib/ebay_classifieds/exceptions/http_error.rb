module EbayClassifieds
  module Exceptions
    class HttpError < StandardError
      attr_accessor :response
      def initialize(resp)
        @response = resp
        request = resp.instance_variable_get("@request")
        uri = request.uri
        super("Unexpected HTTP Error Code: #{resp.code} for uri: #{uri}")
      end
    end
  end
end