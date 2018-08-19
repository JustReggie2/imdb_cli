class ImdbaseCli

  def call
    list_trailers
  end

  def list_trailers
    u_i = nil
    puts "Please type 'list' to see recent movie trailers"
    while u_i != "exit"
      u_i = gets.strip.downcase
      case u_i
      when "list"
        puts "Movie trailers listed."
        movie_info
      when "exit"
        puts "Thank you for using gem!"
      else
        puts "Invalid Entry!"
      end
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
