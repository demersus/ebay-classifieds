module EbayClassifieds
  module Exceptions
    class HttpError < StandardError
      attr_accessor :response
      def initialize(resp)
        @response = resp
        super("Unexpected HTTP Error Code: #{resp.code}; RESPONSE: #{resp.body}")
      end
    end
  end
end