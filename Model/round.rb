class Round
    attr_accessor :user_guess, :code_to_break, :user_results

    def initialize(user_guess, code_to_break)
        @user_guess  = user_guess
        @user_results = []
        @code_to_break = code_to_break
    end

    def check_guess_against_code_for_matching_values()
        reference_hash = map_code_to_hash() # call to private class helper method
        @user_guess.each_with_index do |color, index|
            if reference_hash[index] == color
                @user_results.push("red") #Red == correct color and position
            elsif reference_hash.has_value?(color)
                @user_results.push("white")#white == correct color and incorrect position
            else
                @user_results.push("black") #incorrect
            end
        end
        # returning a shuffled array so the computer’s feedback does not reveal 
        # which number the player guessed correctly
        return @user_results.shuffle!
    end

    def is_code_broken?()
        if @code_to_break == @user_results
            return  true
        end
    end

    # Private Helper method used to create a reference_hash that maps the code sequences color 
    # with its index in order to check players guess color and postion.
    private
    def map_code_to_hash()
        color_to_index_map = {}
        @code_to_break.each_with_index do |color, index|
            color_to_index_map[index] = color
        end
        return color_to_index_map
    end
end