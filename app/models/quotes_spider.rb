class QuotesSpider < Kimurai::Base
    @name = 'quotes_spider'
    @engine = :mechanize
  
    def self.process(url)
      @start_urls = [url]
      self.crawl!
    end
  
    def parse(response, url:, data: {})
      response.xpath("//div[@class='quote']").each do |quote|
        item = {}
  
        item[:quote]        = quote.css('span.text')&.text&.squish
        item[:author]       = quote.css('small.author')&.text&.squish
        item[:author_about] = "http://quotes.toscrape.com" + quote.css('a')[0].attributes["href"].value.squish
        item[:tags]         = quote.css('div.tags a.tag').map {|tag| tag.text.squish}

        Quote.where(item).first_or_create
      end
    end
  end