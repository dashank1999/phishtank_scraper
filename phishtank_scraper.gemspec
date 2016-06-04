$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'phishtank_scraper'
  s.version     = '0.0.2'
  s.date        = '2016-06-03'
  s.summary     = "Scrapes Phishtank submissions"
  s.description = "Scrapes Phishtank submissions given a page interval or an id"
  s.authors     = ["Marlon Méndez"]
  s.email       = 'marlonmendezg@gmail.com'
  s.files       = ["lib/phishtank_scraper.rb", "lib/phishtank_scraper/phishing_set.rb", "lib/phishtank_scraper/site.rb"]
  s.homepage    = 'https://github.com/marlonoso/phishtank_scraper'
  s.license     = 'MIT'

  s.add_dependency 'nokogiri', '~> 1.6', '>= 1.6.7.2'
  s.require_paths = ["lib"]
  s.email = 'marlonmendezg@gmail.com'
  # s.add_dependency 'open-uri'
  # s.add_dependency 'random_user_agent'
end