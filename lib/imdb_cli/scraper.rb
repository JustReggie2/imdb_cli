class Scraper
  IMDB_URL = https://www.imdb.com/trailers

  def self.scrape_trailers
    html = open(IMDB_URL)
    doc = Nokogiri::HTML(html)

  end


end
