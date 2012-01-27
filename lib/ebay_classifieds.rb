require 'json'
require 'net/http'
require 'uri'
module EbayClassifieds
  @@api_url = "http://webapi.ebayclassifieds.com/webapi"
  @@api_username = 'TEST'
  @@api_password = 'TEST'
  
  def self.api_url
    @@api_url
  end
  def self.api_url=(u)
    @@api_url = u
  end
  def self.api_username
    @@api_username
  end
  def self.api_username=(u)
    @@api_username = u
  end
  def self.api_password
    @@api_password
  end
  def self.api_password=(p)
    @@api_password=p
  end
  
  def self.api_get(endpoint,params = {})
    uri = URI.parse(EbayClassifieds.api_url + endpoint + URI.encode_www_form(params))
    http = Net::HTTP.new(uri.host,uri.port)
    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth(@@api_username,@@api_password)
    http.request(req)
  end
end