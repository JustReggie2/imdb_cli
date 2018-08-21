class Scraper
  IMDB_URL = "https://www.imdb.com/trailers"

  def self.scrape_trailers
    html = open(IMDB_URL)
    doc = Nokogiri::HTML(html)

    # binding.pry
    movies = []

    titles = doc.css(".trailer-caption").children.text.split("\n ").reject{|t| t.empty? || t == "   "}
    trailer_links = doc.css(".trailer-image").collect {|tl| tl.css("a").attr("href").value}
    movies_links = doc.css(".trailer-caption").collect {|ml| ml.css("a").attr("href").value}


    titles.each.with_index do |title, i|
      Movie.new(title, "https://www.imdb.com#{trailer_links[i]}", "https://www.imdb.com#{movies_links[i]}")
      # movies << {
      #   :title => title,
      #    :trailer_link => "https://www.imdb.com#{trailer_links[i]}",
      #  :movie_info => movie_info[i]}
    end


# binding.pry
  end


end
