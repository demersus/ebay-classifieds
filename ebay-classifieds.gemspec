# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ebay-classifieds"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nik Petersen"]
  s.date = "2012-02-04"
  s.description = ""
  s.email = "demersus@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "coverage/.resultset.json",
    "coverage/assets/0.5.3/app.js",
    "coverage/assets/0.5.3/fancybox/blank.gif",
    "coverage/assets/0.5.3/fancybox/fancy_close.png",
    "coverage/assets/0.5.3/fancybox/fancy_loading.png",
    "coverage/assets/0.5.3/fancybox/fancy_nav_left.png",
    "coverage/assets/0.5.3/fancybox/fancy_nav_right.png",
    "coverage/assets/0.5.3/fancybox/fancy_shadow_e.png",
    "coverage/assets/0.5.3/fancybox/fancy_shadow_n.png",
    "coverage/assets/0.5.3/fancybox/fancy_shadow_ne.png",
    "coverage/assets/0.5.3/fancybox/fancy_shadow_nw.png",
    "coverage/assets/0.5.3/fancybox/fancy_shadow_s.png",
    "coverage/assets/0.5.3/fancybox/fancy_shadow_se.png",
    "coverage/assets/0.5.3/fancybox/fancy_shadow_sw.png",
    "coverage/assets/0.5.3/fancybox/fancy_shadow_w.png",
    "coverage/assets/0.5.3/fancybox/fancy_title_left.png",
    "coverage/assets/0.5.3/fancybox/fancy_title_main.png",
    "coverage/assets/0.5.3/fancybox/fancy_title_over.png",
    "coverage/assets/0.5.3/fancybox/fancy_title_right.png",
    "coverage/assets/0.5.3/fancybox/fancybox-x.png",
    "coverage/assets/0.5.3/fancybox/fancybox-y.png",
    "coverage/assets/0.5.3/fancybox/fancybox.png",
    "coverage/assets/0.5.3/fancybox/jquery.fancybox-1.3.1.css",
    "coverage/assets/0.5.3/fancybox/jquery.fancybox-1.3.1.pack.js",
    "coverage/assets/0.5.3/favicon_green.png",
    "coverage/assets/0.5.3/favicon_red.png",
    "coverage/assets/0.5.3/favicon_yellow.png",
    "coverage/assets/0.5.3/highlight.css",
    "coverage/assets/0.5.3/highlight.pack.js",
    "coverage/assets/0.5.3/jquery-1.6.2.min.js",
    "coverage/assets/0.5.3/jquery.dataTables.min.js",
    "coverage/assets/0.5.3/jquery.timeago.js",
    "coverage/assets/0.5.3/jquery.url.js",
    "coverage/assets/0.5.3/loading.gif",
    "coverage/assets/0.5.3/magnify.png",
    "coverage/assets/0.5.3/smoothness/images/ui-bg_flat_0_aaaaaa_40x100.png",
    "coverage/assets/0.5.3/smoothness/images/ui-bg_flat_75_ffffff_40x100.png",
    "coverage/assets/0.5.3/smoothness/images/ui-bg_glass_55_fbf9ee_1x400.png",
    "coverage/assets/0.5.3/smoothness/images/ui-bg_glass_65_ffffff_1x400.png",
    "coverage/assets/0.5.3/smoothness/images/ui-bg_glass_75_dadada_1x400.png",
    "coverage/assets/0.5.3/smoothness/images/ui-bg_glass_75_e6e6e6_1x400.png",
    "coverage/assets/0.5.3/smoothness/images/ui-bg_glass_95_fef1ec_1x400.png",
    "coverage/assets/0.5.3/smoothness/images/ui-bg_highlight-soft_75_cccccc_1x100.png",
    "coverage/assets/0.5.3/smoothness/images/ui-icons_222222_256x240.png",
    "coverage/assets/0.5.3/smoothness/images/ui-icons_2e83ff_256x240.png",
    "coverage/assets/0.5.3/smoothness/images/ui-icons_454545_256x240.png",
    "coverage/assets/0.5.3/smoothness/images/ui-icons_888888_256x240.png",
    "coverage/assets/0.5.3/smoothness/images/ui-icons_cd0a0a_256x240.png",
    "coverage/assets/0.5.3/smoothness/jquery-ui-1.8.4.custom.css",
    "coverage/assets/0.5.3/stylesheet.css",
    "coverage/index.html",
    "ebay-classifieds.gemspec",
    "lib/ebay-classifieds.rb",
    "lib/ebay_classifieds/api_connection.rb",
    "lib/ebay_classifieds/api_resource.rb",
    "lib/ebay_classifieds/ebay_classifieds.rb",
    "lib/ebay_classifieds/models/ad.rb",
    "lib/ebay_classifieds/models/ad_address.rb",
    "lib/ebay_classifieds/models/ad_attribute.rb",
    "lib/ebay_classifieds/models/ad_attributes.rb",
    "lib/ebay_classifieds/models/category.rb",
    "lib/ebay_classifieds/models/picture.rb",
    "lib/ebay_classifieds/paginated_collection.rb",
    "spec/api_connection_spec.rb",
    "spec/ebay_classifieds_spec.rb",
    "spec/fixtures/ad-12481583-many_pictures.xml",
    "spec/fixtures/ad-16722980-1_picture.xml",
    "spec/fixtures/ad-16723048-no_pictures.xml",
    "spec/fixtures/ads.xml",
    "spec/models/ad_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/testing.rb"
  ]
  s.homepage = "http://github.com/demersus/ebay-classifieds"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "an ORM to interface with the ebay classifieds api"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_runtime_dependency(%q<multi_xml>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_development_dependency(%q<ruby-debug19>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<rack>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<multi_xml>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_dependency(%q<ruby-debug19>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<multi_xml>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    s.add_dependency(%q<ruby-debug19>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
  end
end

