class Scraper
  IMDB_URL = "https://www.imdb.com/trailers"

  def self.scrape_trailers
    html = open(IMDB_URL)
    doc = Nokogiri::HTML(html)

    titles = doc.css(".trailer-caption").children.text.split("\n ").reject{|t| t.empty? || t == "   "}
    trailer_links = doc.css(".trailer-image").collect {|tl| tl.css("a").attr("href").value}
    movie_links = doc.css(".trailer-caption").collect {|ml| ml.css("a").attr("href").value}

    titles[0..99].each.with_index do |title, i|
      Movie.new(title, "https://www.imdb.com#{trailer_links[i]}", "https://www.imdb.com#{movie_links[i]}")
    end
  end
end

# def self.scrape_movie_info
#   Movie.all.each do |movie|
#     html = open("#{movie.movie_info}")
#     doc = Nokogiri::HTML(html)

# binding.pry
  # title = doc.css(".title_wrapper h1").children[0].text.chop
  # year = doc.css(".title_wrapper a").children[0].text
  # genre = doc.css(".title_wrapper a").children[1].text
  # all genres = doc.css(".title_wrapper a").children[1..3].text
  # summary = doc.css(".summary_text").children.text.strip
  # director = doc.css(".credit_summary_item a")[0].children.text
#   end
# end
