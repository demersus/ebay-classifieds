require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'ebay_classifieds/ads'

describe "ads" do
  it "has a sub module named 'Search'" do
    EbayClassifieds::Ads.const_defined?(:Search).should be_true
  end
  describe "search" do
    it "as a method named api_get" do
      EbayClassifieds::Ads::Search.methods.should include(:api_get)
    end
    describe "#api_get" do
      context "given valid credentials" do
        it "it returns an http response object, when given search parameters" do
          print EbayClassifieds::Ads::Search.api_get({'q' => 'car'})
        end
      end
    end
  end
end