require 'nokogiri'
# require 'random_user_agent'
require 'open-uri'

# Creates a collection of phishing hashes for each phishtank page
# Example
# {
#   id: "4141251",
#   url: "http://bintango.xyz/AIsaE",
#   created_at: "added on Jun 3rd 2016 3:57 PM",
#   submitter: "PhishReporter",
#   valid: "Unknown",
#   online: "ONLINE"
# }

class	PhishingSet
  include Enumerable

  attr_reader :url, :all

  def initialize(url)
    @url = URI(url)

    @page = Nokogiri::HTML(open(@url.to_s))
    @all = scrape_parse
  end

  def scrape_parse
    rows = @page.at('.data').search('tr') 
    rows.shift #removes header

    rows.collect do |row|
      id = row.at_xpath('td[1]/a/text()').to_s.strip
      url_id = row.at_xpath('td[1]/a/@href').to_s.strip

      url = row.at_xpath('td[2]/text()').to_s.strip
      url = scrape_detail(url_id) if url[-3,3] == "..." # incomplete url

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

  def scrape_detail(url)

    uri = URI(url)
    uri = uri.host ? uri : "#{@url.scheme}://#{@url.host}/#{uri}"

    detail_page = Nokogiri::HTML(open(uri))
    detail_page.at("#widecol").at_xpath("div/div[3]/b/text()").to_s
  end

  def first
    @all.first
  end

  def page_at_id(id)
    last_subm_id = self.first[:id].to_i
    ((last_subm_id - id + 1)/20).round # 20 items per page
  end

  def each
    @all.each{ |ph| yield ph }
  end

end