class Movie
  attr_accessor :title, :trailer_link, :movie_info, :director, :summary, :genre,
  :year

  @@all = []

  def initialize(title, trailer_link, movie_info)
    @title = title
    @trailer_link = trailer_link
    @movie_info = movie_info
    @@all << self
  end

  def self.all
    @@all
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.movie_info))
  end

  def director
    @director ||= doc.css(".credit_summary_item a")[0].children.text
  end

  def summary
    @summary ||= doc.css(".summary_text").children.text.strip
  end

  

end
