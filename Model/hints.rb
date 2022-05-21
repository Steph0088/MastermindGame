class Hints
 attr_accessor :round_hints , :total_rounds_hints

    def initialize()
        @round_hints = []
        @total_rounds_hints = []
    end

    def give_hints(array)
        reference_hints = {"red" => "Correct Position and Correct Color", 
            "white" => "Correct Color but Incorrect Position", "black" => "Incorrect Color and Position" }
        array.each do |color|
            round_hints.push(reference_hints[color])
        end
        return round_hints
    end

    def add_to_total_rounds_hints(round_hints)
        total_rounds_hints.push(round_hints)
    end

    def get_total_round_hints()
        return total_rounds_hints
    end
    
end