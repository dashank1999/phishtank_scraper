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
      @pht_scraper.site.domain.must_equal "phishtank.com"
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

    it "must do page scrape"
      
    end
  end

  # describe "when asked about blending possibilities" do
  #   it "won't say no" do
  #     @meme.will_it_blend?.wont_match /^no/i
  #   end
  # end
end