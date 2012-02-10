require 'httparty'
class EbayClassifieds::ApiConnection
  include HTTParty
  
  # Merge settings from base module
  def self.default_options
    (@default_options || {}).merge({
      :base_uri => EbayClassifieds.api_url,
      :digest_auth => {
        :username => EbayClassifieds.api_username,
        :password => EbayClassifieds.api_password
      }
    })
  end
  
  # def self.get(*args)
    # debugger
    # super(*args)
  # end
  
end