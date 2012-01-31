require 'ebay_classifieds/api_connector'
module EbayClassifieds::Ads
  @@api_endpoint = '/ads.json2'
  def self.api_endpoint=o
    @@api_endpoint = o
  end
  def self.api_endpoint
    @@api_endpoint
  end
  
  def self.search_raw(opts = {})
    c = EbayClassifieds::ApiConnector
    c.get(api_endpoint,:query => opts)
  end
  def self.search(opts = {})
    resp = search_raw(opts)
    resp.parsed_response
  end
end