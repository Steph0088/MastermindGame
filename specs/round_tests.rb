require_relative "test_helper"

describe "Round class" do
    
    describe "Compares user guess to code" do
        
        it "Returns Array with color red, black, white by comparing position and color" do
            # Round.new((user_guess, code_to_break))
            current_round = Round.new(["red","blue","purple","orange"],["red","purple","blue","orange"])
            codebreaker_guess = current_round.check_guess_against_code_for_matching_values()
            expect(codebreaker_guess).must_be_instance_of Array
            expect(codebreaker_guess).must_include "red"
            expect(codebreaker_guess).must_include "white"
        end

        it "Returns an Array of the color black if user gets all positions and colors wrong" do
            # Round.new((user_guess, code_to_break))
            current_round = Round.new(["teal","magenta","yellow","pink"],["red","purple","blue","orange"])
            codebreaker_guess = current_round.check_guess_against_code_for_matching_values()
            expect(codebreaker_guess).must_be_instance_of Array
            expect(codebreaker_guess).must_include "black"
        end
    end
end