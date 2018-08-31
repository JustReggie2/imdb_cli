class ImdbCli::Movie
  attr_accessor :title, :movie_info

  @@all = []

  def initialize(title = nil, movie_info = nil)
    @title = title
    # @trailer_link = trailer_link
    @movie_info = movie_info
    @@all << self
  end

  def self.all
    @@all
  end
  # finds specific movie object to pull correct second level info from scrape
  def self.find(id)
    self.all[id-1]
  end
  # allows scrape of each movie objects individual page utilizing methods below
  def doc
    @doc = Nokogiri::HTML(open(self.movie_info))
  end

  def director
    @director = doc.css(".credit_summary_item a")[0].children.text
  end

  def summary
    @summary = doc.css(".summary_text").children.text.strip
  end

  def genre
    @genre = doc.css(".title_wrapper a").children[1].text
  end

  def year
    # binding.pry
    @year = doc.css(".title_wrapper a").children[0].text
  end

  def trailer_link
    @trailer_link = doc.css(".slate a").attr("href").value
  end
end
