require 'spec_helper'

describe "EbayClassifieds::Models::AdAddress" do
  let!(:klass){ EbayClassifieds::Models::AdAddress }
  describe '.new_from_api_data' do
    before :all do
      ad_data = MultiXml.parse(file_fixture('ad-16722980-1_picture.xml'))
      @address_data = ad_data['ad']['ad_address']
      @address_data = ad_data['ad']['ad_address']
      @address_data.should_not be_nil
    end
    context "The returned" do
      subject { klass.new_from_api_data(@address_data) }
      
      it{ should be_a EbayClassifieds::Models::AdAddress }
      its(:street){ should == @address_data['street'] }
      its(:city){ should == @address_data['city'] }
      its(:state){ should == @address_data['state'] }
      its(:zip_code){ should == @address_data['zip_code'] }
      its(:latitude){ should == @address_data['latitude'] }
      its(:longitude){ should == @address_data['longitude'] }        
    end
  end
 
end