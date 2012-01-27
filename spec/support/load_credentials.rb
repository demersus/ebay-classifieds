filename = File.join(File.dirname(__FILE__),'api_credentials.yml')
unless File.exists? filename
  raise "Api Credentials configuration file is missing!  Please see the README"
end
config = YAML.load_file filename
EbayClassifieds.api_username = config['username']
EbayClassifieds.api_password = config['password']
