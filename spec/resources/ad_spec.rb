 require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
 
describe EbayClassifieds::Resources::Ad do
  describe '.new_from_api_data' do
    context 'When given a hash of data from the api response' do
      before do
        @data_from_api = file_fixture('ad-12481583-many_pictures.xml')
      end
      let(:instance) { EbayClassifieds::Resources::Ad.new_from_api_data(@data_from_api)}
      
      it 'should return an instance with the data loaded' do
        instance.id.should_not be_nil
      end
    end
  end
  describe ".search" do
    context "Given search parameters that will return 50 ad results" do
      before do
        @search_params = {:size => 50}
        @url = EbayClassifieds.api_url + EbayClassifieds::Resources::Ad.api_endpoint + '?' +
              URI.encode_www_form(@search_params)
        @api = stub_api_response(:get, @url,
                                   :body =>file_fixture('ads.xml'),
                                   :content_type => 'text/xml')
      end
      
      let(:returned) { EbayClassifieds::Resources::Ad.search(@search_params) }
      
      it "Will call the api with the search parameters" do
        @api.should_receive(:call) do |env|
          #debugger
          env['QUERY_STRING'].should == URI.encode_www_form(@search_params)
          # return original expected response
          @api.response
        end
        returned # trigger action
      end
      
      
      subject {returned}
      
      it { should be_a EbayClassifieds::PaginatedCollection }
      it { should have(50).things }
      
      specify "the returned should be ad resources" do
        returned.all?{|i| i.should be_a EbayClassifieds::Resources::Ad}
      end
    end
  end
  describe '.find' do
    context "Given an ad id" do
      before do
        @id = 16722980
        @url = EbayClassifieds.api_url + EbayClassifieds::Resources::Ad.api_endpoint + '/' + @id.to_s
        @api = stub_api_response(:get, @url,
                                   :body =>file_fixture('ad-16722980-1_picture.xml'),
                                   :content_type => 'text/xml')
      end
      
      let(:returned){ EbayClassifieds::Resources::Ad.find(@id) }
      it "Should call the correct api url with a GET request" do
        @api.should_receive(:call) do |env|
          env['REQUEST_METHOD'].should == 'GET'
          @api.response
        end
        returned # trigger response
      end
            
      specify { returned.should be_a EbayClassifieds::Resources::Ad }
      specify { returned.id.to_s.should == @id.to_s }      
    end
    
  end
end