require_relative "/Users/fridakahlo/Reach/MastermindGame/Controller/game.rb"

class Program
    
    def run()
        theGame = Game.new
        rounds = 2
        

        if (theGame.init())
            
            while (rounds != 0)
                if theGame.code_broken == false
                    theGame.start()
                    theGame.generate_code()
                    theGame.display()
                    current_guess = theGame.prompt_guess()
                    theGame.handle_guess(current_guess)
                    rounds -= 1
                else
                    theGame.game_won()
                end
            end
            
            theGame.game_lost()
            theGame.prompt_new_game
        end
        theGame.finish()
    end
end

program = Program.new
program.run()



# def run()
#     theGame = Game.new

#     if (theGame.init())
#         while (theGame.active)
#             theGame.start()
#             theGame.generate_code()
#             theGame.display_conceiled_code()

#             while (theGame.isPlaying)
#                 theGame.display_guesses_and_hints_history()
#                 theGame.display_conceiled_code()
#                 theGame.HandleGuess(theGame.prompt_guess())
#             end
#             theGame.prompt_new_game()
#         end
#     end
#     theGame.finish()
# end
