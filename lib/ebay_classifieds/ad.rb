require 'ebay_classifieds/resource'
module EbayClassifieds
  class Ad < 
    Struct.new(:price, :locations, :status, :id, :title, :address, :attrubutes, :description, :category, :pictures, :modified_at, :created_at)
    include EbayClassifieds::Resource
    api_endpoint '/ads.xml'
    
    # def self.new_from_json2(json2)
      # new(
       # :id => json2['@id'],
       # :price => json2['price']['amount'],
       # :title => json2['title'],
       # :description => json2['description'],
       # :status => json2['ad-status']['value'],
       # :modified_at => Time.new(json2['modification-date-time']),
       # :created_at => Time.new(json2['start-date-time']),
       # :category => Category.new_from_json2(json2['category']),
       # :attributes => attributes_from_json2(json2),
       # :pictures => json2['pictures'].collect{|p| Picture.new_from_json2(p)},
       # :address => {
         # :street => json2['ad-address']['street'],
         # :city => json2['ad-address']['city'],
         # :state => json2['ad-address']['state'],
         # :zip_code => json2['ad-address']['zip-code'],
         # :latitude => json2['ad-address']['latitude'],
         # :longitude => json2['ad-address']['longitude']
       # }  
      # )
    # end
    # def self.attributes_from_json2(json2)
      # Hash.new
    # end
  end
end