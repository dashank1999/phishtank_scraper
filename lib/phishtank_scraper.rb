require 'phishtank_scraper/phishing_set'

class PhishtankScraper
  attr_reader :phishings

  def initialize(domain="phishtank.com")
    @root_url = "http://#{domain}/phish_search.php?"
    @phishings = []
  end

  def scrape(start_page: 1, finish_page: 1, options = {})
    raise ArgumentError if start_page > finish_page

    actives =  "&active=" + (@options[:active] || "y")
    valid =  "&valid=" + (@options[:valid] || "y")

    start_page.upto(finish_page) do |page_index|
      phishing_set = PhishingSet.new("#{@root_url}#{active}#{valid}&Search=Search")
    end
    
  end

end