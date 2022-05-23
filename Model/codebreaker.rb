class Codebreaker
    attr_accessor :guess, :total_guesses
    def initialize()
        
        @guess = guess
        @total_guesses = []
    end

    def guess()
        #TODO possible Validation of guesses here...check for length, check for valid 
        #colors etc.
    end

    def add_guess_to_history(guess)
        total_guesses.push(guess)
    end

end