require_relative "../Model/RandomSequenceClient.rb"
require_relative "../Model/codemaker.rb"
require_relative "../Model/round.rb"
require_relative "../Model/hints.rb"
require_relative "../Model/codebreaker.rb"
require_relative "../Model/IOManager.rb"


class Game
    attr_accessor :number_of_rounds, :code_broken, :current_round, :active, :is_playing

    COlORS_AVAILABLE = {"purple" => 0, "red"=> 1, "blue"=> 2, "green"=> 3, "orange" => 4, "white"=> 5, "pink"=> 6, "teal"=> 7, "black"=> 8, "magenta"=> 9}
    def initialize()
        @io = IOManager.new
        @random_code = RandomSequenceClient.new
        @codemaker = CodeMaker.new
        @hints = Hints.new
        @current_guess = []
        codebreaker = Codebreaker.new()

        @active = false
        @is_playing = false
        @code_broken = false
        @number_of_rounds = 0
        @code_to_decipher = []
        @total_rounds_guesses = []
        @total_rounds_hints = []
        @history_display = {}
    end

    def start()
        @is_playing = true
    end

    def initiate_game()
        response = @io.prompt_player("Welcome To Mastermind!\nDecipher the colors and their correct positions in the secret code to win this game.\n Each code is made up of 4 colors with a total of 10 Rounds.\n Would you like to play?\n Y/N", false)
        response = response.downcase
        if response == "y" || response == "yes"
            start()
            @active = true
            #@io.print_line("Press any key to begin the game",true)
            #@io.continue_to_game()
        end
        return @active
    end

    def game_rules()
        @io.clear_console()
        @io.print_line("The Code to be deciphered:", false)
        @io.print_line("[X,X,X,X]",false)
        @io.print_line("Possible Colors in Code: purple, red, blue, green, orange, white, pink, magenta, teal", false)
        @io.print_line("------------------------------------------------------------------------------------------", false)
    end

    def generate_code()
        sequence = @random_code.get_random_sequence("easy")
        @code_to_decipher = @codemaker.convert_to_colors(sequence)
    end

    def prompt_codebreaker()
        @current_guess = @io.prompt_player("Please enter 4 colors separated by commas:")
        #Check to see if guess matches colors in dictionary
        
        @current_guess = @current_guess.split(',')
        @current_guess.each do |color|
            color.downcase!
        end
        
        if @current_guess.length != 4
            @io.print_line("Check the number of colors")
            return false
        end
        @current_guess.each do |color|
            if !COlORS_AVAILABLE[color]
                @io.print_line("Incorrect color input: #{color} is not an available color to choose from check reference above, check spelling", true) 
                return false
            end
            return true
        end
    end

    def handle_guess()
        @current_round = Round.new(@current_guess, @code_to_decipher)
        @total_rounds_guesses.push(current_round.user_guess)
        #check the guess against the code to retrieve the colors
        results_of_guess = current_round.check_guess_against_code_for_matching_values()
            if results_of_guess == ["red","red","red","red"]
                @code_broken = true
                @is_playing = false
                @active = false
            end
        current_guess_hints = @hints.give_hints(results_of_guess)
        

        @total_rounds_guesses.push(@current_guess)
        @total_rounds_hints.push(current_guess_hints)
        @number_of_rounds += 1
        self.update_guess_and_hint_history(@current_round.user_guess, current_guess_hints)
    end

    def display()
        return @io.print_line(@history_display, false)
    end
    def game_lost()
        @io.print_line("YOU LOSE! \n Secret Code Revealed: #{@code_to_decipher}", true)
        @is_playing = false
        @active = false
    end

    
    def game_won()
        @io.print_line("YOU WON! CODE BROKEN \nYou are a MASTERMIND!! Winning Code: #{@total_rounds_guesses.last()}", true)
        @is_playing = false
        @active = false
    end

    def prompt_new_game()
        restartResponse = @io.prompt_player("Nice game! Would you like to play again? Y/N")
        restartResponse.downcase()
        if (restartResponse == "y" || restartResponse == "yes")
            @active = true
            @is_playing = true
            return true
        else
            @active = false
            return false
        end
    end

    def finish()
        @io.prompt_player("Game Over.\n We shall meet again.", true)
    end
   
    def update_guess_and_hint_history(guess, current_guess_hints)
        #@total_rounds_guesses = [['red','red','blue','blue'],['red','red','red','red']]
        #@total_rounds_hints = [["bla;fkdlajfladfkdl"],['blahshdfkdfljfdak'],['blajfdlkjfdla;fjkdl;afjd']]
        
        
        last_guess_made  = @total_rounds_guesses.last()
        last_round_hints = @total_rounds_hints.last()
        # puts "These are the total guess array #{@total_rounds_guesses}"
        # puts "This is the last round guess #{last_guess_made}"
        
        # puts "These are the total guess array #{@total_rounds_hints}"
        # puts "These is the last guess made: #{last_round_hints}"
        last_guess_string = ""
        last_guess_made.each do |color|
            last_guess_string << " #{color}"
        end
        @history_display["Round Number:#{number_of_rounds} Guess: #{last_guess_string}"] = last_round_hints 
        #puts @history_display
    end
end


# theGame = Game.new

# theGame.generate_code
# theGame.prompt_codebreaker
# puts theGame.handle_guess
# theGame.display
# #print 
# #["blue","green","blue","red"],["red","blue","red","green"]
# #puts theGame.update_guess_and_hint_history()