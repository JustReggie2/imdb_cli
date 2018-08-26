class ImdbaseCli

  def call
    Scraper.scrape_trailers
    puts "Welcome to IMDB's Currently Most Popular Trailers"
    start
  end

  def start
    # u_i = nil
    puts "What Top trailers would you like to see? 10, 25 or 50?"
      u_i = gets.strip.to_i
      case u_i
      when 10
        puts ""
        puts "Here are the current Popular Top 10 Trailers!"
        list_trailers(10)
        movie_info
      when 25
        puts ""
        puts "Here are the current Popular Top 25 Trailers!"
        list_trailers(25)
        movie_info
      when 50
        puts ""
        puts "Here are the current Popular Top 50 Trailers!"
        list_trailers(50)
        movie_info
      else
        puts "Invalid Entry!"
      end
    puts ""
    puts "Would you like to see trailers list again? (Y/N)"

    u_i = gets.strip.downcase
      case u_i
      when "y"
        start
      when "n"
        puts ""
        puts "Thank you for using IMDB's Trailer Gem!"
      else
        puts ""
        puts "Invalid Entry! Please try again."
        start
      end
  end

  def list_trailers(num)
    # Movie.all.sort! {|a, b| a.title <=> b.title}
    Movie.all[0..num-1].each_with_index do |movie, index|
      puts "#{index+=1}. #{movie.title}"
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
