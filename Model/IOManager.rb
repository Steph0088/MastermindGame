require 'io/console'

class IOManager
    def get_user_input()
      return gets.chomp
    end

    def clear_console()
        return system('clear')
    end

    def print_line(message = "", clear = false)
        if (clear)
            clear_console()
        end
        puts(message)
    end
                                                                                                 
    def continue_to_game()                                                                                                               
        print "Press any key to start game"                                                                                                    
        STDIN.getch                                                                                                              
        print "            \r" # extra space to overwrite in case next sentence is short                                                                                                                                                                                                                                     
        puts "Let the deciphering begin..."                                                                                                                                                                                                 
    end
        
    def prompt_player(message = "", clear = false)
        puts(message)
        return get_user_input()
    end
end