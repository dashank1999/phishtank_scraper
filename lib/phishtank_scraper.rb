require './lib/phishtank_scraper/phishing_set'

class PhishtankScraper

  attr_reader :path
  def initialize(domain="phishtank.com")
    @domain = domain
    @path = build_path 
  end

  # returns an array of detections
  def scrape(start_page: 1, finish_page: 1, options: {})
    raise ArgumentError if start_page > finish_page

    @path = build_path(options)
    (start_page..finish_page).map do |page_index|
      PhishingSet.new(@path).all
    end.flatten
  end

  private
  def build_path(options={})
    "http://#{@domain}/" + if options.any?
      actives =  "&active=" + (@options[:active] || "y")
      valid =  "&valid=" + (@options[:valid] || "y")

      "phish_search.php?#{active}#{valid}&Search=Search"
    else
      "phish_archive.php"
    end
  end
end
