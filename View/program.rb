require_relative "/Users/fridakahlo/Reach/MastermindGame/Controller/game.rb"

class Program
    def run()
        theGame = Game.new 
        theGame.generate_code()
        if theGame.initiate_game
            rounds = 1
            while theGame.active
                while rounds <= 10 && theGame.code_broken == false
                    until theGame.prompt_codebreaker()
                        theGame.prompt_codebreaker()
                    end
                    theGame.handle_guess()
                    theGame.display()
                    rounds += 1
                end
                if theGame.code_broken == false
                    theGame.game_lost()
                elsif theGame.code_broken == true
                    theGame.game_won()
                end
            end
        end
    end
end
program = Program.new
program.run()
