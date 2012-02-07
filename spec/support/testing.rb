module EbayClassifieds
  module Testing
    def disable_digest_auth
      HTTParty::Request.any_instance.stub(:setup_digest_auth){nil}
    end
    def stub_api_response(verb,url,opts = {})
      disable_digest_auth
      api = FakeApi.new(opts)
      stub_request(verb,url).to_rack(api)
      api # return instance
    end
    
    
    class FakeApi
      attr_accessor :headers, :response_code, :body, :auth
      def initialize(opts)
        self.response_code = opts[:code] || 200
        self.headers = {
          'Content-Type' => opts[:content_type] || 'text/plain'
        }
        self.body = opts[:body] || ''
      end
      def response
        # Extracted for message testing in rspec
        # inst.should_receive(:call){|env| ... test input ... }.and_return(inst.response)
        [@response_code,@headers,[@body.strip]]
      end
      def call(env)
        response
      end
      def body=(b)
        @headers['Content-Length'] = b.length.to_s
        @body = b
      end
    end
  end
end