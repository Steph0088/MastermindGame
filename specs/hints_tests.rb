require_relative "test_helper"


describe "Hints class" do
    describe "Given input of colors returns hints " do
        hints = Hints.new
        round_hints = hints.give_hints(["red","black","white","red"])
        
        it "returns a array with the keys being colors and the value as the corresponding hint" do
          expect(round_hints).must_include "Correct Position and Correct Color"
          expect(round_hints).must_include "Correct Color but Incorrect Position"
          expect(round_hints).must_include "Incorrect Color and Position"
        end

        it "Adds round hints to total hints" do
             round_hints = ["Correct Position and Correct Color", "Incorrect Color and Position",  "Incorrect Color and Position","Correct Color but Incorrect Position" ]
             hints.add_to_total_rounds_hints(round_hints)
             total = hints.get_total_round_hints()
             print total
             expect(total[0]).must_equal round_hints
        end
    end
end