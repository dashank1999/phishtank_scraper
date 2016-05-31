Gem::Specification.new do |s|
  s.name        = 'phishtank-scraper'
  s.version     = '0.0.1'
  s.date        = '2016-05-27'
  s.summary     = "Scrapes Phishtank submissions"
  s.description = "Scrapes Phishtank submissions with pagination"
  s.authors     = ["Marlon Méndez"]
  s.email       = 'marlonmendezg@gmail.com'
  s.files       = ["lib/phishtank_scraper.rb", "lib/phishtank_scraper/phishing_set.rb"]
  s.homepage    = 'http://rubygems.org/gems/phishtank-scraper'
  s.license       = 'MIT'

  s.add_dependency 'nokogiri'
  s.add_dependency 'open-uri'
  s.add_dependency 'random_user_agent'
end