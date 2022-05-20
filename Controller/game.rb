require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/RandomSequenceClient.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/codemaker.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/round.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/hints.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/codebreaker.rb"
require_relative "/Users/fridakahlo/Reach/MastermindGame/Model/IOManager.rb"

class Game
    attr_accessor :codebreaker_score, :computer_score, :active, :isPlaying, :max_rounds

    def  initialize()
        @io = IOManager.new
        @random_code = RandomSequenceClient.new
        @codemaker = CodeMaker.new
        @hints = Hints.new
        @max_rounds = 10
        @active = false
        @isPlaying = false
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
        #maybe you will add max_rounds = 10 here undecided
        codebreaker_score = 0
        computer_score = 0
        isPlaying = true
    end

    def generate_code()
        sequence = @random_code.get_random_sequence("easy")
        code_to_decipher = @codemaker.convert_to_colors(sequence)
    end

    def display_conceiled_code()
        @io.clear_console()
        @io.print_line("The Code to be deciphered:", false)
        @io.print_line("[X,X,X,X]",false)
        @io.print_line("Possible Colors in Code: purple, red, blue, green, orange, white, pink, magenta, teal", false)

        # i = 0
        # while (i < currentPhrase.mysteryPhrase.Length i++)
        #     io.Print(#"{currentPhrase.mysteryPhrase[i]} ")
        #     i += 1
        # end
        # io.PrintLine()
    end

    def prompt_guess()
        guess = @io.prompt_player("Please enter 4 colors separated by commas, order matters:")
        #I would consider adding some validation here rather than just taking the first character of the input
        #TODO validate that input is strings
        #TODO validates that they chose the correct code
        
        #might have to use regex here to validate the input
        
        return guess.downcase
    end

    # def HandleGuess(guess)
    #     if (currentPhrase.CurrentPlayingPhrase.Contains(guess) && !usedLetters.Contains(guess))
    #         usedLetters.Add(guess)
    #         revealArr = currentPhrase.RevealLetters(guess)
    #         j = 0
    #         while (j < revealArr.Length)
    #             if (revealArr[j] == guess) 
    #                 correctLengthCount += 1
    #             end
    #             j += 1
    #         end
    #         if (correctLengthCount == currentPhrase.CurrentPlayingPhrase.Length)
    #             GameWon()
    #         else
    #             io.PrintLine(#"Great guess, have another go.")
    #         end
    #     else
    #         io.PrintLine("that was an incorrect letter")
    #         incorrectGuesses += 1
    #         if (incorrectGuesses >= maxGuesses)
    #             GameLost()
    #         end
    #     end
    # end

    # def GameLost()
    #     io.PrintLine(#"YOU LOSE! \nThe winning phrase: {currentPhrase.CurrentPlayingPhrase}", true)
    #     isPlaying = false
    # end

    # def GameWon()
    #     io.PrintLine(#"YOU WON! \nThe winning phrase: {currentPhrase.CurrentPlayingPhrase}", true)
    #     isPlaying = false
    # end

    # def PromptNewRound()
    #         restartResponse = io.PromptPlayer("Nice game! Would you like to play again? Y/N")
    #     restartResponse.ToLower()
    #     if (restartResponse == "y" || restartResponse == "yes")
    #             Start()
    #         else
    #             active = false
    #         end
    #     end
    # end

    # def Finish()
    #     io.PromptPlayer("Game Over.\n We shall meet again.", true)
    # end
end


game = Game.new


game.prompt_guess()