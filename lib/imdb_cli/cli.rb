class ImdbaseCli

  def call
    Scraper.scrape_trailers

    u_i = nil
    puts "Please type 'list' to see most popular movie trailers"
    while u_i != "exit"
      u_i = gets.strip.downcase
      case u_i
      when "list"
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

  def list_trailers
    # Movie.all.sort! {|a, b| a.title <=> b.title}
    Movie.all.each_with_index do |movie, index|
      puts "#{index+=1}. #{movie.title}"
        # puts movie.trailer_link
        # puts movie.movie_info
    end
  end

  def movie_info
    u_i = nil
    puts "For more info on movie, please enter corresponding number."
    while u_i != "exit"
      u_i = gets.strip.to_i
      case u_i
      when integer
        #select corresponding movie
      when "exit"
        list_trailers
      else
        puts "Invalid Entry!"
      end
    end
  end

end
