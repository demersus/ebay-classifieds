require 'httparty'
class EbayClassifieds::ApiConnection
  include HTTParty
  digest_auth EbayClassifieds.api_username, EbayClassifieds.api_password
  base_uri EbayClassifieds.api_url
end