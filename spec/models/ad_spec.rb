require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
 
describe EbayClassifieds::Models::Ad do
  describe '.new_from_api_data' do
    context 'When given a hash of data from the api response' do
      context "the response" do
        before :all do
          @data_from_api = MultiXml.parse(file_fixture('ad-12481583-many_pictures.xml'))
        end
        subject {EbayClassifieds::Models::Ad.new_from_api_data(@data_from_api['ad'])}
        it 'should return an instance with the data loaded' do
          subject.id.should_not be_nil
        end
      end
    end
    context 'Should be able to handle 0, 1, or many pictures' do
      # Due to the way the xml is parsed, the response hash can have
      #  a different structure dependent upon the number of pictures returned.
      context 'many pictures' do
        before do
          @data_from_api = MultiXml.parse(file_fixture('ad-12481583-many_pictures.xml'))
        end
        context 'the response' do
          subject {EbayClassifieds::Models::Ad.new_from_api_data(@data_from_api['ad'])}
          it{should have_at_least(2).pictures}
        end
      end
      context '0 pictures' do
        before do
          @data_from_api = MultiXml.parse(file_fixture('ad-16723048-no_pictures.xml'))
        end
        context 'the response' do
          subject {EbayClassifieds::Models::Ad.new_from_api_data(@data_from_api['ad'])}
          it{should have(0).pictures}
        end 
      end
      context '1 picture' do
        before do
          @data_from_api = MultiXml.parse(file_fixture('ad-16722980-1_picture.xml'))
        end
        context 'the response' do
          subject {EbayClassifieds::Models::Ad.new_from_api_data(@data_from_api['ad'])}
          it{should have(1).pictures}
        end 
      end
    end
  end
  describe ".search" do
    context "Given search parameters that will return 50 ad results" do
      before :all do
        @search_params = {:size => 50}
        @url = EbayClassifieds.api_url + EbayClassifieds::Models::Ad.api_path_join(@search_params)
        @xml = file_fixture('ads.xml')
      end
      
      before :each do
        @api = stub_api_response(:get, @url,
                                   :body =>@xml,
                                   :content_type => 'text/xml')
      end
            
      it "should call the api with the search parameters" do
        @api.should_receive(:call) do |env|
          #debugger
          env['QUERY_STRING'].should == URI.encode_www_form(@search_params)
          # return original expected response
          @api.response
        end
        EbayClassifieds::Models::Ad.search(@search_params)
      end
      
      context "The result" do
      
        subject { EbayClassifieds::Models::Ad.search(@search_params) }
      
        it { should be_a EbayClassifieds::PaginatedCollection }
        it { should have(50).items }
      
        its(:page){ should == 1 }
        its(:total){ should be > 0 }      
        
        it "should contain ad resources" do
          subject.all?{|i| i.should be_a EbayClassifieds::Models::Ad}
        end
      end
    end
  end
  describe '.find' do
    context "Given an ad id" do
      before :all do
        @id = 16722980
        @url = EbayClassifieds.api_url + EbayClassifieds::Models::Ad.api_path_join(@id.to_s)
        @xml = file_fixture('ad-16722980-1_picture.xml')
      end
      before :each do
        @api = stub_api_response(:get, @url,
                                   :body => @xml,
                                   :content_type => 'text/xml')
      end
            
      it "should call .new_from_api_data with a hash to load the model" do
        EbayClassifieds::Models::Ad.should_receive(:new_from_api_data).with(kind_of(Hash))
        EbayClassifieds::Models::Ad.find(@id)
      end
      
      
      it "should call the api with a GET request" do
        @api.should_receive(:call) do |env|
          env['REQUEST_METHOD'].should == 'GET'
          @api.response
        end
        EbayClassifieds::Models::Ad.find(@id)
      end
      
      context "The result" do
        subject{ EbayClassifieds::Models::Ad.find(@id) }
              
        it { should be_a EbayClassifieds::Models::Ad }
        its('id.to_s') { should == @id.to_s }     
      end
    end
    
  end
end