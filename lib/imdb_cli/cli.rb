class ImdbCli::ImdbaseCli

  def call
    ImdbCli::Scraper.scrape_trailers
    puts "Welcome to IMDB's Currently Most Popular Trailers"
    start
  end

  def start
    puts "What Top trailers would you like to see? 10, 25 or 50?"
      u_i = gets.strip.to_i
      case u_i
      when 10
        puts ""
        puts "Here are the current Popular Top 10 Trailers!"
        list_trailers(10)
        movie_info(10)
      when 25
        puts ""
        puts "Here are the current Popular Top 25 Trailers!"
        list_trailers(25)
        movie_info(25)
      when 50
        puts ""
        puts "Here are the current Popular Top 50 Trailers!"
        list_trailers(50)
        movie_info(50)
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
    ImdbCli::Movie.all[0..num-1].each_with_index do |movie, index|
      puts "#{index+=1}. #{movie.title}"
    end
  end

  def movie_info(num)
    puts ""
    puts "For more info on a movie, please enter corresponding number."
      u_i = gets.strip.to_i
      if u_i > 0 && u_i <= num
        movie = ImdbCli::Movie.find(u_i)
          puts "#{movie.title} (#{movie.year})"
          puts ""
          puts "  Summary:  #{movie.summary}"
          puts ""
          puts "  Director: #{movie.director}"
          puts "  Genre:    #{movie.genre}"
          puts ""
          puts "  Trailer:  #{movie.trailer_link}"
      else
        puts "Invalid Entry!"
        movie_info(num)
      end
  end

end
