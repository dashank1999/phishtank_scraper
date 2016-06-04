Phishtank Scraper
================

Phishtank_scraper is a gem for scraping phishtank submissions. Although Phishtank encourages you to get 
their database [here]("http://www.phishtank.com/developer_info.php"), it contains community validated items only,
therefore if nobody sees or validates the submission or it is visible only thru proxy, or the site is already down,
then you won't get it in the database they provide hourly. It turns out this happens with a lot of phishing cases

Phishtank_Scraper gets the id, url, added timestamp, submitter, valid?, online?. Per page interval or since a given id 


## Installation

Install the gem from RubyGems:

    gem install phishtank-scraper


## Usage
Include the gem

    require 'phishtank_scraper'

Initialize a scraper instance

    pt_scraper = PhishtankScraper.new
    or     
    pt_scraper = PhishtankScraper.new("http://www.another-phishtank-domain.com")

Scrape a page interval

    submissions = pt_scraper.page_scrape # first page only 
    submissions = pt_scraper.page_scrape(0..2) # first three pages

Scrape since a submission id (useful for getting new submissions only)

    submissions = pt_scraper.id_scrape(4141331)

You can also provide filtering options

    submissions = pt_scraper.page_scrape((0..2), {active: "y", valid: "y"})

Available:

    active: "All", "n", "y", "u"
    valid: "All", "n", "y", "u"    


Returned array 
    [
      {
        id: "4141252",
        url: "http://bintango.xyz/AIsaE",
        created_at: "added on Jun 3rd 2016 3:57 PM",
        submitter: "PhishReporter",
        valid: "Unknown",
        online: "ONLINE"
      },
      {
        id: "4141251",
        url: "http://bintango.xyz/AIsaF",
        created_at: "added on Jun 3rd 2016 3:58 PM",
        submitter: "PhishReporter",
        valid: "Unknown",
        online: "ONLINE"
      },
      ...
    ]

## Tested in
ruby 2.2.0

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marlonoso/phishtank-scraper.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
