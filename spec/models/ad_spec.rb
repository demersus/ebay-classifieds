require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
 
describe EbayClassifieds::Models::Ad do
  
  describe '.new_from_api_data' do
    let!(:many_pics_data){ MultiXml.parse(file_fixture('ad-12481583-many_pictures.xml')) }
    let!(:one_pic_data){ MultiXml.parse(file_fixture('ad-16722980-1_picture.xml')) }
    let!(:zero_pics_data){ MultiXml.parse(file_fixture('ad-16723048-no_pictures.xml')) }
    
    context 'When given a hash of data from the api response' do
      context "the returned" do

        let (:returned) {EbayClassifieds::Models::Ad.new_from_api_data(many_pics_data['ad'])}
        subject {returned}
        
        it { should be_a EbayClassifieds::Models::Ad }
        
        it "should initialize pictures" do
          EbayClassifieds::Models::Picture.should_receive('new_from_api_data')\
            .exactly(many_pics_data['ad']['pictures']['picture'].size).times
          returned # trigger
        end
        
        its(:id){ should_not be_nil }
        
        it "should initialize an ad_address model" do
          EbayClassifieds::Models::AdAddress.should_receive('new_from_api_data').with(many_pics_data['ad']['ad_address'])
          returned # trigger
        end
        its(:address){ should be_a EbayClassifieds::Models::AdAddress }
        
        it "should initialize a category model" do
          EbayClassifieds::Models::Category.should_receive('new_from_api_data').with(many_pics_data['ad']['category'])
          returned # trigger
        end
        it { should respond_to(:url) }
        its(:url){ should_not be_nil }
        
        its(:category){ should be_a EbayClassifieds::Models::Category }
                     
      end
    end
    context 'Should be able to handle 0, 1, or many pictures' do
      # Due to the way the xml is parsed, the response hash can have
      #  a different structure dependent upon the number of pictures returned.
      context 'many pictures' do
        context 'the response' do
          subject {EbayClassifieds::Models::Ad.new_from_api_data(many_pics_data['ad'])}
          it{should have_at_least(2).pictures}
        end
      end
      context '0 pictures' do
        context 'the response' do
          subject {EbayClassifieds::Models::Ad.new_from_api_data(zero_pics_data['ad'])}
          it{should have(0).pictures}
        end 
      end
      context '1 picture' do
        context 'the response' do
          subject {EbayClassifieds::Models::Ad.new_from_api_data(one_pic_data['ad'])}
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
      
        its(:page){ should == 0 } # Ebay's paging starts with 0
        its(:total){ should be >= 50 }      
        
        it "should contain ad resources" do
          subject.all?{|i| i.should be_a EbayClassifieds::Models::Ad}
        end
      end
    end
    context "Given paremters that will return 0 results" do
      before :all do
        @search_params = {:q => 'contains no ads'}
        @url = EbayClassifieds.api_url + EbayClassifieds::Models::Ad.api_path_join(@search_params)
        @xml = file_fixture('ads-empty.xml')
      end
      
      before :each do
        @api = stub_api_response(:get, @url,
                                   :body =>@xml,
                                   :content_type => 'text/xml')
      end 
      
      subject { EbayClassifieds::Models::Ad.search(@search_params) }
      
      it_behaves_like 'a GET request'
      
      describe "The Result" do
        
        it {should be_a EbayClassifieds::PaginatedCollection}
        its(:total){ should be 0 }
        its(:collection) { should be_empty }
                
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
            
      subject{ EbayClassifieds::Models::Ad.find(@id) } 
           
      it_behaves_like 'a GET request'
      
      
      it "should call .new_from_api_data with a hash to load the model" do
        EbayClassifieds::Models::Ad.should_receive(:new_from_api_data).with(kind_of(Hash))
        subject 
      end
          
      
      context "The result" do                      
        it { should be_a EbayClassifieds::Models::Ad }
        its('id.to_s') { should == @id.to_s }     
      end
    end
    context "Given an invalid ad id" do
      before do
        @id = 0
        @url = EbayClassifieds.api_url + EbayClassifieds::Models::Ad.api_path_join(@id.to_s)
        @api = stub_api_response(:get, @url,
                                   :body => "",
                                   :content_type => 'text/xml',
                                   :code => 404)
      end
      subject{ EbayClassifieds::Models::Ad.find(@id) }
      
      it_behaves_like 'a GET request'
      
      describe "The result" do
        it{ should be_nil }
      end
      
    end
  end
end