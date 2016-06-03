require './lib/phishtank_scraper/phishing_set'
require './lib/phishtank_scraper/site'

# Director interface for scraping
class PhishtankScraper
  attr_reader :site, :range

  def initialize(url="http://phishtank.com")
    @site = Site.new(url)
    @range = (0..0)
  end

  # returns an array of detections in the pages range 
  # options: 
  # active: "All", "n", "y", "u"
  # valid: "All", "n", "y", "u"
  def page_scrape(range=@range, options={})
    build_range(range).map do |page_index|
      PhishingSet.new(@site.build_path(page_index, options)).all
    end.flatten
  end

  # returns an array of detections from id to last submitted id
  # options: 
  # active: "All", "n", "y", "u"
  # valid: "All", "n", "y", "u"
  def id_scrape(since, options={})
    page_at = PhishingSet.new(@site.home).page_at_id(since)

    phset = (0..page_at).map do |page_index|
      PhishingSet.new(@site.build_path(page_index, options)).all
    end.flatten
    
    phset.delete_if {|ph| ph[:id].to_i < since}
  end

  private
  def build_range(value)
    @range = value.class.eql?(Range) ? value : (value..value)
  end 
end
