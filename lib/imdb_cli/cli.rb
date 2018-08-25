class ImdbaseCli

  def call
    Scraper.scrape_trailers
    puts "Welcome to IMDB's Currently Most Popular Trailers"
    start
  end

  def start
    u_i = nil
    puts "What Top trailers would you like to see? 10, 25 or 50?"
    while u_i != "exit"
      u_i = gets.strip.to_i
      case u_i
      when 10
        list_trailers
        movie_info
      when "exit"
        puts "Thank you for using gem!"
      else
        puts "Invalid Entry!"
      end
    end
    list_trailers
  end

  def list_trailers(num)
    # Movie.all.sort! {|a, b| a.title <=> b.title}
    Movie.all.each_with_index(0..num-1) do |movie, index|
      puts "#{index+=1}. #{movie.title}"
        # puts movie.trailer_link
        # puts movie.movie_info
    end
  end

  def movie_info
    u_i = nil
    puts "For more info on a movie, please enter corresponding number."
      u_i = gets.strip.to_i
      if u_i > 0 && u_i <= Movie.all.size
        movie = Movie.all
          puts "#{movie[u_i-=1].title}"
          puts "#{movie[u_i-=1].year}"
      elsif u_i == "exit"
        list_trailers
      else
        puts "Invalid Entry!"
      end
      movie_info
  end

end
