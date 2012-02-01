require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'ebay_classifieds/api_connection'

describe 'api_connection' do
  describe "#get" do
    context "Given a Valid uri endpoint" do
      before :all do 
        @uri_endpoint = '/ads.xml'
      end
      it 'returns a HTTParty response object' do
        r = EbayClassifieds::ApiConnection.get(@uri_endpoint)
        r.class.should be HTTParty::Response
      end
    end 
  end
end
