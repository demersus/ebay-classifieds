require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe EbayClassifieds::ApiConnection do
  
  #its(:base_uri){should == EbayClassifieds.api_url}
  
  describe "#get" do
    context "Given an api path" do
      before do 
        @api_path = '/ads/1'
        @url = EbayClassifieds.api_url + @api_path
        @api = stub_api_response(:get, @url,:body =>file_fixture('ad-16722980-1_picture.xml'),:content_type => 'text/xml')
      end
      
      let(:response) { EbayClassifieds::ApiConnection.get(@api_path) }
      
      specify "Api should receive a GET request" do
        @api.should_receive(:call) do |env|
          env['REQUEST_METHOD'].should == 'GET'
          # return original expected response
          @api.response
        end
        #trigger call
        EbayClassifieds::ApiConnection.get(@api_path)
      end
      
      
      specify { response.code.should be 200 }       
      specify { response.class.should be HTTParty::Response }
      specify { response.parsed_response.should be_a Hash }
      
    end 
  end
end
