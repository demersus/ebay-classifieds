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
  end
    
end
