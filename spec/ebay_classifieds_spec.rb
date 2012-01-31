require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "EbayClassifieds" do
  before :all do
    @original_api_url = EbayClassifieds.api_url
    @original_password = EbayClassifieds.api_password
    @original_username = EbayClassifieds.api_username
  end
  after :all do
    EbayClassifieds.api_url = @original_api_url
    EbayClassifieds.api_username = @original_username
    EbayClassifieds.api_password = @original_password
  end
  it "has a configurable api url" do
    EbayClassifieds.api_url = '/fu'
    EbayClassifieds.api_url.should_not eq @original_api_url
  end
  it "has a configurable username and password" do
    EbayClassifieds.api_username = '123'
    EbayClassifieds.api_username.should_not eq @original_username
    
    EbayClassifieds.api_password = 'abc'
    EbayClassifieds.api_password.should_not eq @original_password
  end
end
