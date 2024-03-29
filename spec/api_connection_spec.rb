require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe EbayClassifieds::ApiConnection do
  describe ".default_options" do
    subject{ EbayClassifieds::ApiConnection.default_options }
    context "When changing the api username and password" do
      before do
        @new_username = 'New Username'
        @new_password = 'New Password'
        EbayClassifieds.api_username = @new_username
        EbayClassifieds.api_password = @new_password
      end
      it "should reflect the changed username in the :digest_auth option" do
        subject[:digest_auth][:username].should == @new_username
      end
      it "should reflect the changed password in the :digest_auth option" do
        subject[:digest_auth][:password].should == @new_password
      end
    end
    context "When changing the api url" do
      before do
        @old_url = EbayClassifieds.api_url
        @new_url = 'http://ebay-api.somewhere.com'
        EbayClassifieds.api_url = @new_url
      end
      # after do
        # EbayClassifieds.api_url = @old_url
      # end
      its([:base_uri]){ should == @new_url }
    end
  end
  
  describe ".get" do
    context "Given an api path" do
      before :all do 
        @api_path = '/ads/1'
        @url = EbayClassifieds.api_url + @api_path
        @xml = file_fixture('ad-16722980-1_picture.xml')
      end
      before { @api = stub_api_response(:get, @url,:body => @xml,:content_type => 'text/xml') }
      specify "should call the api with a GET request" do
        @api.should_receive(:call) do |env|
          env['REQUEST_METHOD'].should == 'GET'
          # return original expected response
          @api.response
        end
        #trigger call
        EbayClassifieds::ApiConnection.get(@api_path)
      end
      context 'The response' do
        let(:response){ EbayClassifieds::ApiConnection.get(@api_path) }
        it "should be a HTTParty::Response" do
          response.class.should be HTTParty::Response
        end
        it "should should have a code of 200" do 
          response.code.should be 200 
        end       
        it "should have a parsed_response of Hash" do
          response.parsed_response.should be_a Hash
        end
      end
    end 
  end
end
