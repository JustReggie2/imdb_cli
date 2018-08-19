class Scraper
  IMDB_URL = "https://www.imdb.com/trailers"

  def self.scrape_trailers
    html = open(IMDB_URL)
    doc = Nokogiri::HTML(html)

    # binding.pry
    movies = []
    titles = doc.css(".trailer-caption").children.text.split("\n ")
    trailer_link = doc.css(".trailer-image").collect {|tl| tl.css("a").attr("href").value}
binding.pry
    

  end


end
