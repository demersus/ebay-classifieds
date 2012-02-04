require 'httparty'
class EbayClassifieds::ApiConnection
  include HTTParty
  def self.get(*args)
    digest_auth EbayClassifieds.api_username, EbayClassifieds.api_password
    base_uri EbayClassifieds.api_url
    super(*args)
  end
end