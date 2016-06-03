require 'minitest/autorun'
require './lib/phishtank_scraper/phishing_set'

describe PhishingSet do
  before do
    #puts "#{File.absolute_path(File.dirname(__FILE__) + '/fixtures/4139120-4139101.html')}"
    @phset = PhishingSet.new("#{File.absolute_path(File.dirname(__FILE__) + '/fixtures/4139120-4139101.html')}")
  end

  it "must scrape into an array" do
    @phset.all.class.must_equal Array
  end
  it "must scrape into an array of hashes" do
    @phset.all.first.class.must_equal Hash
  end
  it "must contain url" do
    @phset.all.first[:url].must_equal "http://firststandardpath.com/upgradeuser/aolmailservice"
  end
  it "must scrape all page" do
    @phset.all.size.must_equal 21 # 20 + header
  end

  it "must return page_at id" do
    @phset.page_at_id(4139111).must_equal 0
  end
  it "must return page_at far_id" do
    @phset.page_at_id(4138111).must_equal 50
  end


end