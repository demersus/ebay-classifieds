# require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
# 
# describe "ad" do
  # describe "#search" do
    # context "Given search parameters that will return a number of results" do
      # before :each do
        # @search_params = {:size => 5}
        # url = EbayClassifieds.api_url + EbayClassifieds::Resources::Ad.api_endpoint
        # stub_request(:any,url).with(:query => @search_params).to_rack(
          # FakeApi.new(:body =>file_fixture('ads.xml'),:content_type => 'text/xml')
        # )
      # end
      # it "returns a paginated collection object" do
        # r = EbayClassifieds::Resources::Ad.search(@search_params)
        # r.should be_an_instance_of EbayClassifieds::PaginatedCollection
      # end
      # it "the returned collection should not be empty" do
        # r = EbayClassifieds::Resources::Ad.search(@search_params)
        # r.should have_at_least(1).things
      # end
      # it "the returned collection should be ad resources" do
        # r = EbayClassifieds::Resources::Ad.search(@search_params)
        # r.all?{|i| i.should be_an_instance_of EbayClassifieds::Resources::Ad}
      # end
    # end
  # end
# end