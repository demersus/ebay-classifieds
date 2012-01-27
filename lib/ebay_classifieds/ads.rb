module EbayClassifieds::Ads
  @@api_endpoint = '/ads?'
  def self.api_endpoint
    @@api_endpoint
  end
  module Search
    def self.api_get(query = {})
      EbayClassifieds.api_get(EbayClassifieds::Ads.api_endpoint,query)
    end
  end
end