require 'httparty'
class EbayClassifieds::ApiConnection
  include HTTParty
  def self.setup_defaults
    digest_auth EbayClassifieds.api_username, EbayClassifieds.api_password
    base_uri EbayClassifieds.api_url
  end
  def self.get(*args)
    setup_defaults
    super(*args)
  end
  def self.head(*args)
    setup_defaults
    super(*args)
  end
  def self.put(*args)
    setup_defaults
    super(*args)
  end
  def self.post(*args)
    setup_defaults
    super(*args)
  end
  def self.delete(*args)
    setup_defaults
    super(*args)
  end
end