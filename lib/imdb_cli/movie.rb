class Movie
  attr_accessor :title, :trailer_link, :movie_info, :director, :description, :rating

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

end
