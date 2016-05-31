require 'nokogiri'
require 'random_user_agent'
require 'open-uri'

class	PhishingSet
  # include Enumerable

  attr_reader :url, :all

  def initialize(url)
    @url = url
    @page = Nokogiri::HTML(open(@url, 'User-Agent' => RandomUserAgent.randomize))
    @all = scrape_parse
  end

  def scrape_parse
    rows = @page.at('.data').search('tr') 
    rows.shift #removes header

    rows.collect do |row|
      id = row.at_xpath('td[1]/a/text()').to_s.strip

      url = row.at_xpath('td[2]/text()').to_s.strip
      url = scrape_detail(id) if url[-3,3] = "..." # incomplete url

      {
        id: id,
        url: url,
        created_at: row.at_xpath('td[2]/span/text()').to_s.strip,
        submitter: row.at_xpath('td[3]/a/text()').to_s.strip,
        valid: row.at_xpath('td[4]/text()').to_s.strip,
        online: row.at_xpath('td[5]/strong/text()').to_s.strip
      }
    end
  end

  def scrape_detail(id)
    uri = URI(@url)
    detail_url = "#{uri.scheme}://#{uri.host}/phish_detail.php?phish_id=#{id}"

    detail_page = Nokogiri::HTML(open(detail_url, 'User-Agent' => RandomUserAgent.randomize))
    detail_page.at("#widecol").at_xpath("div/div[3]/b/text()").to_s
  end

  # def each
  #   @phishings.each{ |ph| yield ph }
  # end

end