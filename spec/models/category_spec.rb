require 'spec_helper'

describe "EbayClassifieds::Models::Category" do
  
  let!(:klass) {EbayClassifieds::Models::Category}
  
  describe ".new_from_api_data" do
    context "When given a valid hash returned from the api" do
      before :all do
        ad_data = MultiXml.parse(file_fixture('ad-16722980-1_picture.xml'))
        @category_data = ad_data['ad']['category']
        @category_data.should_not be_nil
      end
      context "the returned" do
        subject { klass.new_from_api_data(@category_data) }
        
        it{ should be_a EbayClassifieds::Models::Category }
                
        its(:id) { should be @category_data['id'] }
        
        its(:name) { should be @category_data['localized_name'] }
      end
    end
    context "When given a hash containing sub categories" do
      before :all do
        categories = MultiXml.parse(file_fixture('categories.xml'))
        @category_data = categories['categories']['category']
      end
      
      context "The returned" do
        subject { klass.new_from_api_data(@category_data) }
        its(:sub_categories){ should_not be_empty }
      end
      
    end
  end
  describe ".all" do
    before :all do
      @url = EbayClassifieds.api_url + EbayClassifieds::Models::Category.api_path_join
      @xml = file_fixture('categories.xml')
    end
    
    before :each do
      @api = stub_api_response(:get, @url,
                                 :body =>@xml,
                                 :content_type => 'text/xml')
    end
    let(:returned){ EbayClassifieds::Models::Category.all }
    it "should call the api with a GET request" do
      @api.should_receive(:call) do |env|
        env['REQUEST_METHOD'].should == "GET"
        # return original expected response
        @api.response
      end
      returned # Trigger action
    end
    context "The Returned" do
      subject{returned}
      # The api returns one big wrapper category called 'All'
      it { should be_a EbayClassifieds::Models::Category }
      its(:name){ should include "All" }
      its(:sub_categories){ should_not be_empty }  
    end 
  end
  describe ".find" do
    context "Given a valid category id (100012)" do
      before :all do
        @id = 100012
        @url = EbayClassifieds.api_url + 
                EbayClassifieds::Models::Category.api_path_join('/' + @id.to_s)
        @xml = file_fixture('category-100012.xml')
      end
      before :each do
        @api = stub_api_response(:get, @url,
                                   :body =>@xml,
                                   :content_type => 'text/xml')
      end
      let(:returned){ EbayClassifieds::Models::Category.find(@id) }
      it "should call the api with a GET request" do
        @api.should_receive(:call) do |env|
          env['REQUEST_METHOD'].should == "GET"
          # return original expected response
          @api.response
        end
        returned # Trigger action
      end
      context "The Returned" do
        subject{returned}
        it{ should be_a EbayClassifieds::Models::Category }
        its(:name){ should_not be_nil }
        its(:id){ should == @id.to_s }
      end
    end
  end
    
end
