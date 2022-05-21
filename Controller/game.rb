require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/RandomSequenceClient.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/codemaker.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/round.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/hints.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/codebreaker.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/IOManager.rb"

class Game
    attr_accessor :active, :isPlaying, :max_rounds, :current_round, 
    :current_guess, :total_rounds_guesses, :code_broken

    def  initialize()
        @io = IOManager.new
        @random_code = RandomSequenceClient.new
        @codemaker = CodeMaker.new
        @hints = Hints.new
        @max_rounds = 10
        @active = false
        @isPlaying = false
        @total_rounds_guesses = []
        @code_to_decipher = []
        @code_broken = false
    end

    # assign player name, give user the rules of the game, set player to active
    def init()
        response = @io.prompt_player("Welcome To Mastermind!\nDecipher the colors and their correct positions in the secret code to win this game.\n Each code is made up of 4 colors with a total of 10 Rounds.\n Would you like to play?\n Y/N")
        response = response.downcase
        if (response == "y" || response == "yes")
            player_name = @io.prompt_player("What is your name?")
            codebreaker = Codebreaker.new(player_name)
            @active = true
            @io.print_line("Hello #{player_name}, you are now a codebreaker.Good Luck!", true)
            @io.print_line("Press any key to begin the game",true)
            @io.continue_to_game()
        end
        return @active
    end
   
    #Once you start game keep track of rounds so they don't exceed 10
    #Once you start game keey track of codebreaker_Score, ComputerScore
    def start()
        isPlaying = true
    end

    def generate_code()
        sequence = @random_code.get_random_sequence("easy")
        @code_to_decipher = @codemaker.convert_to_colors(sequence)
    end

    def display_conceiled_code()
        @io.clear_console()
        @io.print_line("The Code to be deciphered:", false)
        @io.print_line("[X,X,X,X]",false)
        @io.print_line("Possible Colors in Code: purple, red, blue, green, orange, white, pink, magenta, teal", false)
    end

    def prompt_guess()
        guess = @io.prompt_player("Please enter 4 colors separated by commas, order matters:")
        #I would consider adding some validation here rather than just taking the first character of the input
        #TODO validate that input is strings
        #TODO validates that they chose the correct code
        
        #might have to use regex here to validate the input

        return guess.downcase
    end

    def handle_guess(guess)
        current_round = Round.new(guess,@code_to_decipher)
        @total_rounds_guesses.push(current_round.user_guess)

        if (@max_rounds != 0)
            #check the guess against the code to retrieve the colors
            results_of_guess = current_round.check_guess_against_code()
            if results_of_guess == ["red","red","red","red"]
                @code_broken = true
            end
            #add the current guesses hints to hints history so it can be displayed to user.
            current_guess_hints = @hints.give_hints(results_of_guess)
            @io.print_line(current_guess_hints, false)
            @io.print_line(@total_rounds_guesses,false)

            hints_history = @hints.add_to_total_rounds_hints(current_guess_hints)
            @max_rounds -= 1
        else
            if @code_broken == true
                game_won()
            else
                game_lost() 
            end
        end

    end

    def display_guesses_and_hints_history()
        @io.print_line(@total_rounds_guesses)
        @io.print_line(@total_rounds_hints)
    end

   
    def game_lost()
        @io.print_line("YOU LOSE! \n Secret Code Revealed: #{@code_to_decipher}", true)
        @isPlaying = false
    end

    def game_won()
        @io.print_line("YOU WON! CODE BROKEN \nYou are a MASTERMIND!! Code: #{total_rounds_guesses.last()}", true)
        @isPlaying = false
    end

    def prompt_new_game()
        restartResponse = @io.prompt_player("Nice game! Would you like to play again? Y/N")
        restartResponse.downcase()
        if (restartResponse == "y" || restartResponse == "yes")
            Start()
        else
            active = false
        end
    end

    def finish()
        @io.prompt_player("Game Over.\n We shall meet again.", true)
    end
end


game = Game.new


#game.generate_code()
#game.display_conceiled_code()
#game.handle_guess(["red","purple","teal","white"])
#game.game_lost()
#game.game_won()
#game.prompt_new_game()
#game.finish()
#game.display_guesses_and_hints_history()

