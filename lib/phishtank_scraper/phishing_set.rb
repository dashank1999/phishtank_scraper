class	PhishingSet
  include Enumerable

  def initialize(url)
    @url = url
    @page = http_client.get(@url)
  end

  def scrape_parse
    data = ph.at('.data').search('tr')
  end

  def each
    
  end

  private
  def http_client
    Mechanize.new do |agent|
      agent.user_agent = RandomUserAgent.randomize
      agent.max_history = 0
    end
  end  
end