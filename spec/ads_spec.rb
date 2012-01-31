require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'ebay_classifieds/ads'

describe "ads" do
  describe "#search_raw" do
    it 'returns a response object' do 
      resp = EbayClassifieds::Ads.search_raw()
      resp.class.should be HTTParty::Response
    end
  end
  describe "#search" do
    it 'returns a hash' do
      resp = EbayClassifieds::Ads.search(:q => 'cats',:size => 5)
      debugger
      resp.class.should be Hash
    end
  end
end