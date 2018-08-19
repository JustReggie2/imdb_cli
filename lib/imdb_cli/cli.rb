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
      when "exit"
        puts "Thank you for using gem!"
      else
        puts "Invalid Entry!"
      end
    end
  end

end
