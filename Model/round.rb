
class Round
    attr_accessor :user_guess, :code_to_break

    def initialize(user_guess, code_to_break)
        @user_guess  = user_guess
        @code_to_break = code_to_break
    end

    def check_guess_against_code()
        user_results = []
        reference_hash = map_code_to_hash()
        user_guess.each_with_index do |color,index|
            if reference_hash[color] &&  reference_hash[color] == index
                user_results.push("red")
            elsif reference_hash[color]
                user_results.push("white")
            else
                user_results.push("black")
            end
        end
        #returning a shuffled array so that user has to figure out what is in correct position and what isn't
        return user_results.shuffle!
    end
    private
    def map_code_to_hash()
        color_to_index_map = {}
        code_to_break.each_with_index do |color, index|
            color_to_index_map[color] = index
        end
        return color_to_index_map
    end
end
#TODO create color dictionary  class to inherit from or module so you can use it in various programs.