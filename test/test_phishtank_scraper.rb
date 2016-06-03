require 'minitest/autorun'
require 'phishtank_scraper'

describe PhishtankScraper do
  before do
    @pht_scraper = PhishtankScraper.new
  end

  describe "when initialize" do
    it "must have a site" do
      @pht_scraper.site.class.must_equal Site
    end

    it "site must be phistank.com" do
      @pht_scraper.site.domain.must_equal "http://phishtank.com"
    end

    it "site's home must be phistank.com/phish_archive.php?page=0" do
      @pht_scraper.site.home.must_equal "http://phishtank.com/phish_archive.php?page=0"
    end

    it "must have a range" do
      @pht_scraper.range.class.must_equal Range
    end

    it "range must be (0..0)" do
      @pht_scraper.range.must_equal (0..0)
    end

    # Runs against real site. I didn't knew how to deal with urls and fixture file
    it "must return scraped page without interval" do
      scraped = @pht_scraper.page_scrape
      scraped.class.must_equal Array and scraped.size.must_equal 20
    end

    # Runs against real site. I didn't knew how to deal with urls and fixture file
    it "must return scraped page with interval" do
      scraped = @pht_scraper.page_scrape(0..1)
      scraped.class.must_equal Array and scraped.size.must_equal 40
    end


  end

end