module EbayClassifieds
  module Testing
    def disable_digest_auth
      HTTParty::Request.any_instance.stub(:setup_digest_auth){nil}
    end
    def stub_api_response(verb,url,opts = {})
      disable_digest_auth
      stub_request(verb,url).to_rack(FakeApi.new(opts))
    end
    
    
    class FakeApi
      attr_accessor :headers, :response_code, :body, :auth
      def initialize(opts)
        @body = opts[:body] || '',
        @response_code = opts[:code] || 200
        @headers = {
          'Content-Type' => opts[:content_type] || 'text/plain',
          'Content-Length' => body.length.to_s
        }
      end
      def call(env)
        [@response_code,@headers,[@body]]
      end
      def body=(b)
        @headers['Content-Length'] = body.length.to_s
        @body = b
      end
    end
  end
end