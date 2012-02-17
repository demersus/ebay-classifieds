# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'ebay_classifieds/version'

Gem::Specification.new do |s|
  s.name         = "ebay-classifieds"
  s.version      = EbayClassifieds::VERSION
  s.authors      = ["Nik Petersen"]
  s.email        = "demersus@gmail.com"
  s.homepage     = "https://github.com/demersus/ebay-classifieds"
  s.summary      = "an ORM to interface with the ebay classifieds api"
  s.description  = "an ORM to interface with the ebay classifieds api"

  s.files        = `git ls-files lib`.split("\n")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'
end
