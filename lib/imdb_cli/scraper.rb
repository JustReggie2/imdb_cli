class Scraper
  IMDB_URL = "https://www.imdb.com/trailers"

  def self.scrape_trailers
    html = open(IMDB_URL)
    doc = Nokogiri::HTML(html)

    movies = []

    titles = doc.css(".trailer-caption").children.text.split("\n ").reject{|t| t.empty? || t == "   "}
    trailer_link = doc.css(".trailer-image").collect {|tl| tl.css("a").attr("href").value}
    movie_info = doc.css(".trailer-caption").collect {|ml| ml.css("a").attr("href").value}

    x = 0
    titles.each do |title|
      movies << {:title => title, :trailer_link => trailer_link[x], :movie_info => movie_info[x]}
      x += 1
    end
    movies
  end


end
