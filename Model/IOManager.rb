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
        
    def prompt_player(message = "", clear = false)
        puts(message)
        return get_user_input()
    end
end