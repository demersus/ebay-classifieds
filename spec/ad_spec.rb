require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'ebay_classifieds/ad'

describe "ad" do
  describe "#search" do
    context "Given valid search parameters" do
      before :all do
        @search_params = {:size => 5}
      end
      it "returns a paginated collection object" do
        r = EbayClassifieds::Ad.search(@search_params)
        r.class.should be EbayClassifieds::PaginatedCollection
      end
      it "returns a paginated collection with atleast one ad" do
        r = EbayClassifieds::Ad.search(@search_params)
        r.first.class.should be EbayClassifieds::Ad
      end
    end
  end
end